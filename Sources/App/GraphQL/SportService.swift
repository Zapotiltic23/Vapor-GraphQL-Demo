//
//  SportService.swift
//
//
//  Created by Horacio Alexandro Sanchez on 4/27/24.
//

import Foundation
import Graphiti
import Vapor

extension Schema: @unchecked Sendable {}

public struct SportServiceAPI : Sendable, API {
    public typealias ContextType = Request
    public let resolver: SportServiceResolver
    public let schema: Schema<SportServiceResolver, Request>
}

final actor SportService: Sendable {
    
    static let shared: SportService = SportService()
    
    let sportServiceAPI: SportServiceAPI = SportServiceAPI(
        resolver: SportServiceResolver(),
        schema: try! Schema<SportServiceResolver,Request> {
            
            Scalar(UUID.self)
            Scalar(Date.self)
            Scalar(Data.self)
            
            Input(UserPayload.self, as: "UserPayload") {
                InputField("id", as: UUID.self)
                InputField("name", as: String.self)
                InputField("lastName", as: String.self)
                InputField("userName", as: String.self)
                InputField("email", as: String.self)
                InputField("password", as: String.self)
                InputField("confirmPassword", as: String.self)
                InputField("userRole", as: String.self)
                InputField("dateOfBirth", as: String.self)
                InputField("hasRegisteredRole", as: Bool.self)
                InputField("deviceIDs", as: [UUID].self)
                InputField("updatedBy", as: UUID.self)
                InputField("createdAt", as: Date.self)
                InputField("updatedAt", as: Date.self)
            }
            
            Type(DrillModel.self) {
                Field("id", at: \.id)
                Field("athleteID", at: \.$athlete.id)
                Field("name", at: \.name)
                Field("recordedMeasure", at: \.recordedMeasure)
                Field("unitOfMeasure", at: \.unitOfMeasure)
                Field("drillType", at: \.drillType)
                Field("drillSport", at: \.drillSport)
                Field("createdAt", at: \.createdAt)
                Field("updatedAt", at: \.updatedAt)
                Field("updatedBy", at: \.updatedBy)
            }
            
            Type(TokenModel.self) {
                Field("id", at: \.id)
                Field("value", at: \.value)
                Field("userID", at: \.$user.id)
                Field("createdAt", at: \.createdAt)
            }
            
            Type(UserModel.self) {
                Field("id", at: \.id)
                Field("name", at: \.name)
                Field("lastName", at: \.lastName)
                Field("email", at: \.email)
                Field("userRole", at: \.userRole)
                Field("dateOfBirth", at: \.dateOfBirth)
                Field("createdAt", at: \.createdAt)
                Field("updatedAt", at: \.updatedAt)
                Field("updatedBy", at: \.updatedBy)
                Field("hasRegisteredRole", at: \.hasRegisteredRole)
                Field("deviceIDs", at: \.deviceIDs)
                Field("userName", at: \.userName)
            }
            
            Type(CoachModel.self) {
                Field("id", at: \.id)
                Field("name", at: \.name)
                Field("userID", at: \.$user.id)
                Field("lastName", at: \.lastName)
                Field("email", at: \.email)
                Field("sport", at: \.sport)
                Field("leagueName", at: \.leagueName)
                Field("coachTitle", at: \.coachTitle)
                Field("leagueDivision", at: \.leagueDivision)
                Field("isAvailable", at: \.isAvailable)
                Field("season", at: \.season)
                Field("teamName", at: \.teamName)
                Field("institutionImageName", at: \.institutionImageName)
                Field("teamGender", at: \.teamGender)
                Field("badgeSize", at: \.badgeSize)
                Field("badgeStyle", at: \.badgeStyle)
                Field("reasonWhy", at: \.reasonWhy)
                Field("leagueImageName", at: \.leagueImageName)
                Field("phoneNumber", at: \.phoneNumber)
                Field("athleteIDs", at: \.athleteIDs)
                Field("teamID", at: \.teamID)
                Field("leagueID", at: \.leagueID)
                Field("age", at: \.age)
                Field("profileImageName", at: \.profileImageName)
                Field("institutionName", at: \.institutionName)
                Field("nationality", at: \.nationality)
                Field("updatedBy", at: \.updatedBy)
                Field("createdAt", at: \.createdAt)
                Field("updatedAt", at: \.updatedAt)
            }
            
            Type(AthleteModel.self) {
                Field("id", at: \.id)
                Field("name", at: \.name)
                Field("userID", at: \.$user.id)
                Field("lastName", at: \.lastName)
                Field("email", at: \.email)
                Field("athleteNumber", at: \.athleteNumber)
                Field("position", at: \.position)
                Field("sport", at: \.sport)
                Field("leagueName", at: \.leagueName)
                Field("leagueDivision", at: \.leagueDivision)
                Field("isCaptain", at: \.isCaptain)
                Field("isInjured", at: \.isInjured)
                Field("isAvailable", at: \.isAvailable)
                Field("isSuspended", at: \.isSuspended)
                Field("season", at: \.season)
                Field("teamName", at: \.teamName)
                Field("teamGender", at: \.teamGender)
                Field("badgeSize", at: \.badgeSize)
                Field("badgeStyle", at: \.badgeStyle)
                Field("reasonWhy", at: \.reasonWhy)
                Field("leagueImageName", at: \.leagueImageName)
                Field("phoneNumber", at: \.phoneNumber)
                Field("coachIDs", at: \.coachIDs)
                Field("drillIDs", at: \.drillIDs)
                Field("teamID", at: \.teamID)
                Field("leagueID", at: \.leagueID)
                Field("age", at: \.age)
                Field("nickname", at: \.nickname)
                Field("grade", at: \.grade)
                Field("institutionImageName", at: \.institutionImageName)
                Field("profileImageName", at: \.profileImageName)
                Field("institutionName", at: \.institutionName)
                Field("gpa", at: \.gpa)
                Field("nationality", at: \.nationality)
                Field("clubName", at: \.clubName)
                Field("updatedBy", at: \.updatedBy)
                Field("createdAt", at: \.createdAt)
                Field("updatedAt", at: \.updatedAt)
            }
            
            Type(GameModel.self) {
                Field("id", at: \.id)
                Field("gameDate", at: \.gameDate)
                Field("homeTeamID", at: \.homeTeamID)
                Field("homeTeamScore", at: \.homeTeamScore)
                Field("awayTeamID", at: \.awayTeamID)
                Field("awayTeamScore", at: \.awayTeamScore)
                Field("gameLocation", at: \.gameLocation)
                Field("gameDescription", at: \.gameDescription)
                Field("isCancelled", at: \.isCancelled)
                Field("gameType", at: \.gameType)
                Field("gameSport", at: \.gameSport)
                Field("leagueID", at: \.leagueID)
                Field("updatedBy", at: \.updatedBy)
                Field("createdAt", at: \.createdAt)
                Field("updatedAt", at: \.updatedAt)
            }
            
            Type(FileModel.self) {
                Field("id", at: \.id)
                Field("ownerId", at: \.ownerId)
                Field("fileType", at: \.fileType)
                Field("fileName", at: \.fileName)
                Field("fileData", at: \.fileData)
                Field("createdAt", at: \.createdAt)
            }
            
            Type(VisitorModel.self) {
                Field("id", at: \.id)
                Field("userID", at: \.$user.id)
                Field("name", at: \.name)
                Field("userName", at: \.userName)
                Field("lastName", at: \.lastName)
                Field("email", at: \.email)
                Field("teamsFollowed", at: \.teamsFollowed)
                Field("leaguesFollowed", at: \.leaguesFollowed)
                Field("updatedBy", at: \.updatedBy)
                Field("createdAt", at: \.createdAt)
                Field("updatedAt", at: \.updatedAt)
            }
            
            Query {
                Field("getAllDrills", at: SportServiceResolver.getAllDrills)
                Field("getAllUsers", at: SportServiceResolver.getAllUsers)
                Field("getAllAthletes", at: SportServiceResolver.getAllAthletes)
                Field("getAllCoaches", at: SportServiceResolver.getAllCoaches)
                Field("getAllGames", at: SportServiceResolver.getAllGames)
                Field("getAllFiles", at: SportServiceResolver.getAllFiles)
                Field("getAllVisitors", at: SportServiceResolver.getAllVisitors)
                Field("handleLogin", at: SportServiceResolver.handleLogin)
            }
            
            Mutation {
                Field("createUser", at: SportServiceResolver.createUser) {
                    Argument("payload", at: \.payload)
                }
            }
        })
}
        

