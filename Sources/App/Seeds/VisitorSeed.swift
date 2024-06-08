//
//  VisitorSeed.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/3/24.
//

import Foundation
import Vapor
import Fluent

struct VisitorSeed: AsyncMigration {
    func prepare(on database: Database) async throws {
        for visitor in MockSeedData.shared.buildVisitorSeed() {
            try await visitor.create(on: database)
        }
    }
    
    func revert(on database: Database) async throws {
        try await VisitorModel.query(on: database).delete()
    }
}
