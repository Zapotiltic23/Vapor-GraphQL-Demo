import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor
import Graphiti
import GraphQL

func routes(_ app: Application) throws {
    
    let publicAPI:RoutesBuilder = app.routes.grouped("api-v2")
    let basicAuthMiddleware: Authenticator = UserModel.authenticator()
    let tokenAuthMiddleware: Authenticator = TokenModel.authenticator()
    
    // Ensure that a user has been authenticated before reaching your route handler.
    let guardAuthMiddleware: Middleware = UserModel.guardMiddleware()
    
    //MARK: Public APIs
    publicAPI.post("register") { req async throws -> SportServiceResponse in
        return await handleGraphQLRequest(req: req)
    }
    
    //MARK: [Protected] Basic Auth APIs
    publicAPI.grouped(basicAuthMiddleware)
        .grouped(BasicAuthenticationMiddleware())
        .grouped(guardAuthMiddleware)
        .post("login") { req async throws -> SportServiceResponse in
            return await handleGraphQLRequest(req: req)
        }
    
    //MARK: [Protected] Bearer Token APIs
    publicAPI.grouped(tokenAuthMiddleware)
        .grouped(guardAuthMiddleware)
        .post("graphql") { req async throws -> SportServiceResponse in
            return await handleGraphQLRequest(req: req)
        }
}

func handleGraphQLRequest(req: Request) async -> SportServiceResponse {
    do {
        let request = try req.content.decode(GraphQLRequest.self)
        let graphqlResult:GraphQLResult = try await SportService.shared.sportServiceAPI.execute(
            request: request.query,
            context: req,
            on: req.eventLoop,
            variables: request.variables
        )
        
        // Encode the GraphQLResult to JSON
        let jsonData = try JSONEncoder().encode(graphqlResult)
        printData(data: jsonData)
        return SportServiceResponse(statusCode: 200, data: jsonData)
    } catch {
        return SportServiceResponse(statusCode: 400, errorMessage: error.localizedDescription)
    }
}

func printData(data: Data) {
    if let responseString = String(data: data, encoding: .utf8) {
        Task { @MainActor in
            prettyPrintJSON(responseString)
        }
    }
}

public func prettyPrintJSON(_ jsonString: String) {
    if let jsonData = jsonString.data(using: .utf8),
       let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers),
       let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
       let prettyPrintedString = String(data: prettyJsonData, encoding: .utf8) {
        print(prettyPrintedString)
    } else {
        print("Failed to pretty print JSON.")
    }
}
