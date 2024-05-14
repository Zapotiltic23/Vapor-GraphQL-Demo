//
//  UserMigration.swift
//  
//
//  Created by Horacio Alexandro Sanchez on 7/23/23.
//

import Foundation
import Fluent

struct UserMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.user_schema)
            .id()
            .field(.email, .string, .required)
            .field(.passwordHash, .string, .required)
            .field(.name, .string, .required)
            .field(.userName, .string, .required)
            .field(.lastName, .string, .required)
            .field(.userRole, .string, .required)
            .field(.dateOfBirth, .string, .required)
            .field(.hasRegisteredRole, .bool, .required)
            .field(.deviceIDs, .array(of: .uuid), .required)
            .field(.createdAt, .string)
            .field(.updatedAt, .string)
            .field(.updatedBy, .uuid)
            .unique(on: .email)
            .unique(on: .userName)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.user_schema).delete()
    }
}

