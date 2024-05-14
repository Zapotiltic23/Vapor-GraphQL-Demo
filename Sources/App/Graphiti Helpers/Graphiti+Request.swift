import Vapor
import Graphiti
import GraphQL
import NIO

extension Request {
    func resolveByBody<T:API>(api: T) async throws -> GraphQLResult {
        let queryRequest = try self.content.decode(GraphQLRequest.self)
        return try await self.resolve(byQueryRequest: queryRequest, api: api)
    }
    
    func resolveByQueryParameters<T:API>(api: T) async throws -> GraphQLResult {
        guard let queryString = self.query[String.self, at: "query"] else { throw GraphQLError(message: "Query Not Found!") }
        let variables = self.query[String.self, at: "variables"].flatMap {
            $0.data(using: .utf8).flatMap { (data) -> [String: Map]? in
                let decoder = JSONDecoder()
                if #available(OSX 10.12, *) {
                    decoder.dateDecodingStrategy = .iso8601
                }
                return try? decoder.decode([String: Map]?.self, from: data)
            }
        }
        
        let operationName = self.query[String.self, at: "operationName"]
        let data = GraphQLRequest(query: queryString, operationName: operationName, variables: variables ?? [:])
        return try await resolve(byQueryRequest: data, api: api)
    }
    
    private func resolve<T:API>(byQueryRequest data: GraphQLRequest, api: T) async throws -> GraphQLResult {
        let group: MultiThreadedEventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
        defer {
            try? group.syncShutdownGracefully()
        }
        let request = GraphQLRequest(query: data.query, operationName: data.operationName, variables: data.variables)
        let context: T.ContextType = self as! T.ContextType
        let result: GraphQLResult = try await api.execute(request: request, context: context, on: group)
        return result
    }
}

