//
//  CoachSeed.swift
//  
//
//  Created by Horacio Alexandro Sanchez on 5/3/24.
//

import Foundation
import Vapor
import Fluent

struct CoachSeed: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await MockSeedData.shared.buildCoachSeed().create(on: database)
    }
    
    func revert(on database: Database) async throws {
        try await CoachModel.query(on: database).delete()
    }
}
