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

struct CreateUserArgs: Codable {
    let payload: UserPayload
}

public final class SportServiceResolver: Sendable {
    
    public static let shared: SportServiceResolver = SportServiceResolver()
    
    //MARK: User Model
    func getAllUsers(request: Request, arguments: NoArguments) async throws -> [UserModel] {
        let dbModels : [UserModel] = try await UserModel.query(on: request.db).all()
        return dbModels
    }
    
    func createUser(request: Request, arguments: CreateUserArgs) async throws -> [UserModel] {
        do {
            guard let email = arguments.payload.email,
                  let name = arguments.payload.name,
                  let lastName = arguments.payload.lastName,
                  let password = arguments.payload.password,
                  let userRole = arguments.payload.userRole,
                  let deviceIDs = arguments.payload.deviceIDs,
                  let dateOfBirth = arguments.payload.dateOfBirth,
                  let userName = arguments.payload.userName
            else {
                throw NetworkErrors.modelExists("Missing field arguments")
            }
            guard let lookup : [UserModel] = try? await UserModel.query(on: request.db).group(.or, { relation in
                relation.filter(\.$email == email)
                relation.filter(\.$userName == userName)
            }).all() else {
                throw NetworkErrors.modelExists("Model already exists!")
            }
            
            if lookup.count <= 0 {
                let userID: UUID = arguments.payload.id ?? UUID()
                let userToSave: UserModel = UserModel(id: userID,
                                                      name: name,
                                                      lastName: lastName,
                                                      email: email,
                                                      passwordHash: try Bcrypt.hash(password),
                                                      userRole: userRole,
                                                      dateOfBirth: dateOfBirth,
                                                      deviceIDs: deviceIDs,
                                                      hasRegisteredRole: arguments.payload.hasRegisteredRole ?? false,
                                                      updatedBy: arguments.payload.updatedBy,
                                                      userName: userName)
                
                try await userToSave.save(on: request.db)
                return [userToSave]
            } else {
                throw NetworkErrors.modelExists("Model already exists!")
            }
        } catch {
            throw NetworkErrors.modelExists("Model already exists!")
        }
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
    
    //MARK: Game Model
    func getAllGames(request: Request, arguments: NoArguments) async throws -> [GameModel] {
        let dbModels : [GameModel] = try await GameModel.query(on: request.db).all()
        return dbModels
    }
    
    //MARK: File Model
    func getAllFiles(request: Request, arguments: NoArguments) async throws -> [FileModel] {
        let dbModels : [FileModel] = try await FileModel.query(on: request.db).all()
        return dbModels
    }
    
    //MARK: Visitor Model
    func getAllVisitors(request: Request, arguments: NoArguments) async throws -> [VisitorModel] {
        let dbModels : [VisitorModel] = try await VisitorModel.query(on: request.db).all()
        return dbModels
    }
    
    //MARK: Authentication
    func handleLogin(request: Request, arguments: NoArguments) async throws -> [TokenModel]? {
        do {
            let user = try request.auth.require(UserModel.self)
            let token: TokenModel = try user.generateToken()
            try await token.save(on: request.db)
            return [token]
        } catch {
            throw Abort(.unauthorized, reason: error.localizedDescription)
        }
    }
}

