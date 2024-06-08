//
//  GamePayload.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/1/24.
//

import Foundation
import Vapor

public struct GamePayload: Content {
    
    var id: UUID?
    var homeTeamID: UUID?
    var awayTeamID: UUID?
    var leagueID: UUID?
    var isCancelled: Bool?
    var gameType: String?
    var gameSport: String?
    var gameDate: Date?
    var homeTeamScore: Int?
    var gameLocation: String?
    var gameDescription: String?
    var updatedBy: UUID?
    var createdAt: Date?
    var updatedAt: Date?
    
    init(id: UUID?, leagueID: UUID?, homeTeamID: UUID?, awayTeamID: UUID?, isCancelled: Bool?, gameType: String?, gameSport: String?, gameDate: Date?, homeTeamScore: Int?, gameLocation: String?, gameDescription: String?, updatedBy: UUID?, createdAt: Date?, updatedAt: Date?) {
        self.id = id
        self.homeTeamID = homeTeamID
        self.leagueID = leagueID
        self.awayTeamID = awayTeamID
        self.isCancelled = isCancelled
        self.gameType = gameType
        self.gameSport = gameSport
        self.gameDate = gameDate
        self.homeTeamScore = homeTeamScore
        self.gameLocation = gameLocation
        self.gameDescription = gameDescription
        self.updatedBy = updatedBy
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
