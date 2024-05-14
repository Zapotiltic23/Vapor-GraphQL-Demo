import Vapor
import Graphiti
import GraphQL

extension RoutesBuilder {
    public func register<T:API>(
        api: T,
        at path: PathComponent = "graphql",
        postBodyStreamStrategy: HTTPBodyStreamStrategy = .collect) where T:Sendable {
            
        self.on(.POST, path, body: postBodyStreamStrategy) { (request) async throws -> Response in
            let result = try await request.resolveByBody(api: api)
            return try await result.encodeResponse(status: .ok, for: request)
        }
        self.get(path) { (request) async throws -> Response in
            let result = try await request.resolveByQueryParameters(api: api)
            return try await result.encodeResponse(status: .ok, for: request)
        }
    }
}

extension GraphQLResult: Content {
    public func encodeResponse(for request: Request) async throws -> Response {
        let data = try GraphQLJSONEncoder().encode(self)
        return Response(
            status: .ok,
            headers: [
                "Content-Type": "application/json"
            ],
            body: .init(data: data)
        )
    }
}
