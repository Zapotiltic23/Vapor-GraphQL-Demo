//
//  FileMigration.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/1/24.
//

import Foundation
import Fluent

struct FileMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.file_schema)
            .id()
            .field(.ownerId, .uuid, .required)
            .field(.fileName, .string, .required)
            .field(.fileType, .string, .required)
            .field(.createdAt, .string)
            .field(.fileData, .data)
            .unique(on: .fileName)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.file_schema).delete()
    }
}
