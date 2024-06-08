//
//  GameModel.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/1/24.
//

import Foundation
import Fluent
import Vapor

final class GameModel: Model, Content {
    
    static let schema = Constants.ModelSchema.game_schema
    
    //MARK: Relations
    
    
    //MARK: Fields
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .leagueID)
    var leagueID: UUID
    
    @Field(key: .homeTeamID)
    var homeTeamID: UUID
    
    @Field(key: .awayTeamID)
    var awayTeamID: UUID
    
    @Field(key: .isCancelled)
    var isCancelled: Bool
    
    @Field(key: .gameType)
    var gameType: String
    
    @Field(key: .gameSport)
    var gameSport: String
    
    @OptionalField(key: .gameDate)
    var gameDate: Date?
    
    @OptionalField(key: .homeTeamScore)
    var homeTeamScore: Int?
    
    @OptionalField(key: .awayTeamScore)
    var awayTeamScore: Int?
    
    @OptionalField(key: .gameLocation)
    var gameLocation: String?
    
    @OptionalField(key: .gameDescription)
    var gameDescription: String?
    
    @OptionalField(key: .updatedBy)
    var updatedBy: UUID?
    
    @Timestamp(key: .createdAt, on: .create, format: .iso8601)
    var createdAt: Date?
    
    @Timestamp(key: .updatedAt, on: .update, format: .iso8601)
    var updatedAt: Date?
        
        
    init() {}
    
    init(id: UUID?, leagueID: UUID, homeTeamID: UUID, awayTeamID: UUID, isCancelled: Bool, gameType: String, gameSport: String, gameDate: Date?, homeTeamScore: Int?, awayTeamScore: Int?, gameLocation: String?, gameDescription: String?, updatedBy: UUID?, createdAt: Date?, updatedAt: Date?) {
        self.id = id
        self.leagueID = leagueID
        self.homeTeamID = homeTeamID
        self.awayTeamID = awayTeamID
        self.isCancelled = isCancelled
        self.gameType = gameType
        self.gameSport = gameSport
        self.gameDate = gameDate
        self.homeTeamScore = homeTeamScore
        self.awayTeamScore = awayTeamScore
        self.gameLocation = gameLocation
        self.gameDescription = gameDescription
        self.updatedBy = updatedBy
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
