//
//  GameSeed.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/1/24.
//

import Foundation
import Vapor
import Fluent

struct GameSeed: AsyncMigration {
    func prepare(on database: Database) async throws {
        for game in MockSeedData.shared.buildGameSeed() {
            try await game.create(on: database)
        }
    }
    
    func revert(on database: Database) async throws {
        try await GameModel.query(on: database).delete()
    }
}
