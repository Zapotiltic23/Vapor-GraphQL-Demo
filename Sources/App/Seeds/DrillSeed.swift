//
//  DrillSeed.swift
//
//
//  Created by Horacio Alexandro Sanchez on 4/28/24.
//

import Foundation
import Vapor
import Fluent

struct DrillSeed: AsyncMigration {
    func prepare(on database: Database) async throws {
        for drill in MockSeedData.shared.buildDrillSeeds() {
            try await drill.create(on: database)
        }
    }
    
    func revert(on database: Database) async throws {
        try await DrillModel.query(on: database).delete()
    }
}
