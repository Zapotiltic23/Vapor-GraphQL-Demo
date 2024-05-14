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
            
            Type(DrillModel.self) {
                Field("id", at: \.id)
                Field("athleteID", at: \.$athlete.id)
                Field("name", at: \.name)
                Field("recordedMeasure", at: \.recordedMeasure)
                Field("unitOfMeasure", at: \.unitOfMeasure)
                Field("drillType", at: \.drillType)
                Field("createdAt", at: \.createdAt)
                Field("updatedAt", at: \.updatedAt)
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
            
            Query {
                Field("getAllDrills", at: SportServiceResolver.getAllDrills)
                Field("getAllUsers", at: SportServiceResolver.getAllUsers)
                Field("getAllAthletes", at: SportServiceResolver.getAllAthletes)
                Field("getAllCoaches", at: SportServiceResolver.getAllCoaches)
            }
            
            Mutation {
                Field("handleLogin", at: SportServiceResolver.handleLogin) {
                    Argument("name", at: \.name)
                    Argument("lastName", at: \.lastName)
                    Argument("userName", at: \.userName)
                    Argument("dateOfBirth", at: \.dateOfBirth)
                    Argument("email", at: \.email)
                    Argument("password", at: \.password)
                    Argument("userRole", at: \.userRole)
                }
            }
        })
}

