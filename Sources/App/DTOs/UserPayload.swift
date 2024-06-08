//
//  UserPayload.swift
//  
//
//  Created by Horacio Alexandro Sanchez on 7/23/23.
//

import Foundation
import Vapor

struct UserPayload: Content, Validatable {
    var id: UUID?
    var name: String?
    var lastName: String?
    var userName: String?
    var email: String?
    var updatedBy: UUID?
    var password: String?
    var confirmPassword: String?
    var userRole: String?
    var hasRegisteredRole: Bool?
    var deviceIDs: [UUID]?
    var dateOfBirth: String?
    var createdAt: Date?
    var updatedAt: Date?
    
    init(id: UUID?, name: String?, lastName: String?, userName: String?, email: String?, password: String?, confirmPassword: String?, userRole: String?, dateOfBirth: String?, hasRegisteredRole: Bool?, deviceIDs: [UUID]?, updatedBy: UUID?, createdAt: Date? = nil, updatedAt: Date? = nil) {
        self.name = name
        self.lastName = lastName
        self.userName = userName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.userRole = userRole
        self.dateOfBirth = dateOfBirth
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.hasRegisteredRole = hasRegisteredRole
        self.updatedBy = updatedBy
        self.deviceIDs = deviceIDs
        
    }
    
    static func validations(_ validations: inout Validations) {
        validations.add("email", as: String.self, is: .email)
        validations.add("password", as: String.self, is: .count(8...))
    }
    
    func jsonString() throws -> String {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let jsonData = try encoder.encode(self)
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            throw EncodingError.invalidValue(self, EncodingError.Context(codingPath: [], debugDescription: "Failed to encode JSON string"))
        }
        return jsonString
    }
}
