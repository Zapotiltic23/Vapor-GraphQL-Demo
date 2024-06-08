//
//  AnalyticsResponse.swift
//  
//
//  Created by Horacio Alexandro Sanchez on 1/30/23.
//

import Fluent
import Vapor

struct SportServiceResponse: Content, AsyncResponseEncodable {
     
    var data: Data?
    var statusCode: Int
    var errorMessage: String?
    var dateOrigin: Date
    
    init (statusCode: Int, dateOrigin: Date = .now, data: Data? = nil, errorMessage: String? = nil) {
        self.statusCode = statusCode
        self.errorMessage = errorMessage
        self.dateOrigin = dateOrigin
        self.data = data
    }
    
    func encodeResponse(for request: Vapor.Request) async throws -> Vapor.Response {
        let response = Response()
        try response.content.encode(self)
        return response
    }
}


struct GraphQLResponse<T: Codable>: Codable {
    let data: T?
    let errors: [GraphQLError]?
}

struct GraphQLError: Codable {
    let message: String
    let locations: [GraphQLLocation]?
}

struct GraphQLLocation: Codable {
    let line: Int
    let column: Int
}
