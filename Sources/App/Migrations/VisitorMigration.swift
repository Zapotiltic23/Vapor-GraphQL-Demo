//
//  VisitorMigration.swift
//  
//
//  Created by Horacio Alexandro Sanchez on 6/3/24.
//

import Foundation
import Fluent

struct VisitorMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.visitor_schema)
            .id()
            .field(.userID, .uuid, .required, .references(Constants.ModelSchema.user_schema, "id"))
            .field(.email, .string, .required)
            .field(.name, .string, .required)
            .field(.userName, .string, .required)
            .field(.lastName, .string, .required)
            .field(.teamsFollowed, .array(of: .uuid), .required)
            .field(.leaguesFollowed, .array(of: .uuid), .required)
            .field(.createdAt, .string)
            .field(.updatedAt, .string)
            .field(.updatedBy, .uuid)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.visitor_schema).delete()
    }
}
