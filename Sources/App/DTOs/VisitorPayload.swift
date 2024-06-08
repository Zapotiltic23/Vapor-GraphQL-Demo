//
//  VisitorPayload.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/3/24.
//

import Foundation
import Vapor

struct VisitorPayload: Content {
    var id: UUID?
    var name: String?
    var lastName: String?
    var userName: String?
    var email: String?
    var teamsFollowed: [UUID]?
    var leaguesFollowed: [UUID]?
    var updatedBy: UUID?
    var createdAt: Date?
    var updatedAt: Date?
    
    init(id: UUID?, name: String?, lastName: String?, userName: String?, email: String?, teamsFollowed: [UUID]?, leaguesFollowed: [UUID]?, updatedBy: UUID?, createdAt: Date?, updatedAt: Date?) {
        self.name = name
        self.lastName = lastName
        self.userName = userName
        self.email = email
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.updatedBy = updatedBy
        self.teamsFollowed = teamsFollowed
        self.leaguesFollowed = leaguesFollowed
    }
}
