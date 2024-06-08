//
//  VisitorModel.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/3/24.
//

import Foundation
import Fluent
import Vapor

final class VisitorModel: Model, Content {
    
    static let schema = Constants.ModelSchema.visitor_schema
    
    //MARK: Relations
    
    @Parent(key: .userID)
    var user: UserModel
    
    //MARK: Fields
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .name)
    var name: String
    
    @Field(key: .userName)
    var userName: String
    
    @Field(key: .lastName)
    var lastName: String
    
    @Field(key: .email)
    var email: String
    
    @Field(key: .teamsFollowed)
    var teamsFollowed: [UUID]
    
    @Field(key: .leaguesFollowed)
    var leaguesFollowed: [UUID]
    
    @OptionalField(key: .updatedBy)
    var updatedBy: UUID?
    
    @Timestamp(key: .createdAt, on: .create, format: .iso8601)
    var createdAt: Date?
    
    @Timestamp(key: .updatedAt, on: .update, format: .iso8601)
    var updatedAt: Date?
    
    init() {}
    
    init(id: UUID?, userID: UserModel.IDValue, name: String, userName: String, lastName: String, email: String, teamsFollowed: [UUID], leaguesFollowed: [UUID], updatedBy: UUID?, createdAt: Date?, updatedAt: Date?) {
        self.id = id
        self.$user.id = userID
        self.name = name
        self.userName = userName
        self.lastName = lastName
        self.email = email
        self.teamsFollowed = teamsFollowed
        self.leaguesFollowed = leaguesFollowed
        self.updatedBy = updatedBy
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
