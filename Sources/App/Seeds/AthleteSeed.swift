//
//  AthleteSeed.swift
//
//
//  Created by Horacio Alexandro Sanchez on 4/28/24.
//

import Foundation
import Vapor
import Fluent

struct AthleteSeed: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await MockSeedData.shared.buildAthleteSeed().create(on: database)
    }
    
    func revert(on database: Database) async throws {
        try await AthleteModel.query(on: database).delete()
    }
}
