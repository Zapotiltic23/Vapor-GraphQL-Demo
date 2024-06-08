//
//  GameMigration.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/1/24.
//

import Foundation
import Fluent

struct GameMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.game_schema)
            .id()
            .field(.gameDate, .date)
            .field(.homeTeamScore, .int)
            .field(.awayTeamScore, .int)
            .field(.gameLocation, .string)
            .field(.gameDescription, .string)
            .field(.createdAt, .string)
            .field(.updatedAt, .string)
            .field(.updatedBy, .uuid)
            .field(.homeTeamID, .uuid, .required)
            .field(.awayTeamID, .uuid, .required)
            .field(.isCancelled, .bool, .required)
            .field(.gameType, .string, .required)
            .field(.gameSport, .string, .required)
            .field(.leagueID, .uuid, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.game_schema).delete()
    }
}
