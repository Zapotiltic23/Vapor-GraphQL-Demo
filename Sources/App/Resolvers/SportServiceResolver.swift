//
//  Resolver.swift
//
//
//  Created by Horacio Alexandro Sanchez on 4/27/24.
//

import Foundation
import Graphiti
import Vapor
import Fluent

public final class SportServiceResolver: Sendable {
    
    public static let shared: SportServiceResolver = SportServiceResolver()
    
    //MARK: User Model
    func getAllUsers(request: Request, arguments: NoArguments) async throws -> [UserModel] {
        let dbModels : [UserModel] = try await UserModel.query(on: request.db).all()
        return dbModels
    }
    
    //MARK: Athlete Model
    func getAllAthletes(request: Request, arguments: NoArguments) async throws -> [AthleteModel] {
        let dbModels : [AthleteModel] = try await AthleteModel.query(on: request.db).all()
        return dbModels
    }
    
    //MARK: Coach Model
    func getAllCoaches(request: Request, arguments: NoArguments) async throws -> [CoachModel] {
        let dbModels : [CoachModel] = try await CoachModel.query(on: request.db).all()
        return dbModels
    }
    
    //MARK: Drill Model
    func getAllDrills(request: Request, arguments: NoArguments) async throws -> [DrillModel] {
        let dbModels : [DrillModel] = try await DrillModel.query(on: request.db).all()
        return dbModels
    }
    
    //MARK: Authentication
    func handleLogin(request: Request, arguments: UserPayload) async throws -> TokenModel? {
        do {
            let jsonString: String = try arguments.jsonString()
            try UserPayload.validate(json: jsonString)
            let hasUserAuthenticated: Bool = request.auth.has(UserModel.self)
            let user: UserModel = try request.auth.require(UserModel.self)
            let token: TokenModel = try user.generateToken()
            try await token.save(on: request.db)
//            return token
            guard let filteredModels : [TokenModel] = try? await TokenModel.query(on: request.db).group(.or, { relation in
                relation.filter(\.$user.$id == user.id ?? UUID())
            }).all() else { return nil }
            guard let dbToken: TokenModel = filteredModels.first else {return nil}
            return dbToken
        } catch {
            return nil
        }
    }
}



