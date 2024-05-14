//
//  AthleteMigration.swift
//
//
//  Created by Horacio Alexandro Sanchez on 8/27/23.
//

import Foundation
import Fluent

struct AthleteMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.athlete_schema)
            .id()
            .field(.userID, .uuid, .required, .references(Constants.ModelSchema.user_schema, "id"))
            .field(.athleteNumber, .int32)
            .field(.name, .string, .required)
            .field(.lastName, .string, .required)
            .field(.position, .string)
            .field(.sport, .string, .required)
            .field(.leagueName, .string, .required)
            .field(.leagueDivision, .string)
            .field(.leagueID, .uuid, .required)
            .field(.isCaptain, .bool, .required)
            .field(.isInjured, .bool, .required)
            .field(.isAvailable, .bool, .required)
            .field(.isSuspended, .bool, .required)
            .field(.season, .string)
            .field(.teamName, .string, .required)
            .field(.teamGender, .string, .required)
            .field(.teamID, .uuid, .required)
            .field(.badgeStyle, .string)
            .field(.badgeSize, .string)
            .field(.reasonWhy, .string)
            .field(.leagueImageName, .string)
            .field(.email, .string)
            .field(.phoneNumber, .string)
            .field(.coachIDs, .array(of: .uuid), .required)
            .field(.drillIDs, .array(of: .uuid), .required)
            .field(.age, .int32)
            .field(.nickname, .string)
            .field(.grade, .string)
            .field(.profileImageName, .string)
            .field(.gpa, .double)
            .field(.institutionName, .string)
            .field(.institutionImageName, .string)
            .field(.nationality, .string)
            .field(.clubName, .string)
            .field(.createdAt, .string)
            .field(.updatedAt, .string)
            .field(.updatedBy, .uuid)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Constants.ModelSchema.athlete_schema).delete()
    }
}
