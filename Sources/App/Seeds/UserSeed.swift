//
//  UserSeed.swift
//
//
//  Created by Horacio Alexandro Sanchez on 4/28/24.
//

import Foundation
import Vapor
import Fluent

struct UserSeed: AsyncMigration {
    func prepare(on database: Database) async throws {
        for user in MockSeedData.shared.buildUserSeeds() {
            try await user.create(on: database)
        }
    }
    
    func revert(on database: Database) async throws {
        try await UserModel.query(on: database).delete()
    }
}
