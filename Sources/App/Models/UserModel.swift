//
//  UserModel.swift
//  
//
//  Created by Horacio Alexandro Sanchez on 7/23/23.
//

import Foundation
import Fluent
import Vapor

extension UserModel: Authenticatable {}

extension UserModel: ModelAuthenticatable {
    static let usernameKey = \UserModel.$email
    static let passwordHashKey = \UserModel.$passwordHash
    public func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.passwordHash)
    }
}

final class UserModel: Model, Content {
    
    static let schema = Constants.ModelSchema.user_schema
    
    @ID(key: .id)
    var id: UUID?
    
    @Children(for: \.$user)
    var coaches: [CoachModel]
    
    @Children(for: \.$user)
    var athlete: [AthleteModel]
    
    @Field(key: .name)
    var name: String
    
    @Field(key: .userName)
    var userName: String
    
    @Field(key: .lastName)
    var lastName: String
    
    @Field(key: .email)
    var email: String
    
    @Field(key: .passwordHash)
    var passwordHash: String
    
    @Field(key: .userRole)
    var userRole: String
    
    @Field(key: .dateOfBirth)
    var dateOfBirth: String
    
    @Field(key: .deviceIDs)
    var deviceIDs: [UUID]
    
    @Field(key: .hasRegisteredRole)
    var hasRegisteredRole: Bool
    
    @OptionalField(key: .updatedBy)
    var updatedBy: UUID?
    
    @Timestamp(key: .createdAt, on: .create, format: .iso8601)
    var createdAt: Date?
    
    @Timestamp(key: .updatedAt, on: .update, format: .iso8601)
    var updatedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, name: String, lastName: String, email: String, passwordHash: String, userRole: String, dateOfBirth: String, deviceIDs: [UUID], hasRegisteredRole: Bool, updatedBy: UUID?, userName: String) {
        self.id = id
        self.name = name
        self.email = email
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.passwordHash = passwordHash
        self.userRole = userRole
        self.deviceIDs = deviceIDs
        self.hasRegisteredRole = hasRegisteredRole
        self.updatedBy = updatedBy
        self.userName = userName
    }
    
    func generateToken() throws -> TokenModel {
        try .init(
            value: [UInt8].random(count: 16).base64,
            userID: self.requireID()
        )
    }
}
