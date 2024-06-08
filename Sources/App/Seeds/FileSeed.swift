//
//  FileSeed.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/1/24.
//

import Foundation
import Vapor
import Fluent

struct FileSeed: AsyncMigration {
    func prepare(on database: Database) async throws {
        for file in MockSeedData.shared.buildFileSeeds() {
            try await file.create(on: database)
        }
    }
    
    func revert(on database: Database) async throws {
        try await FileModel.query(on: database).delete()
    }
}
