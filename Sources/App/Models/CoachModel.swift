//
//  Coach.swift
//  
//
//  Created by Horacio Alexandro Sanchez on 8/27/23.

import Foundation
import Fluent
import Vapor

final class CoachModel: Model, Content {
    
    static let schema = Constants.ModelSchema.coach_schema
    
    //MARK: Relations
    
    @Parent(key: .userID)
    var user: UserModel
    
    @Siblings(
        through: CoachAthletePivot.self,
        from: \.$coach,
        to: \.$athlete)
    var athletes: [AthleteModel]
    
    //MARK: Fields ...
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .athleteIDs)
    var athleteIDs: [UUID]
    
    @Field(key: .teamID)
    var teamID: UUID
    
    @Field(key: .leagueID)
    var leagueID: UUID
    
    @Field(key: .name)
    var name: String
    
    @Field(key: .lastName)
    var lastName: String
    
    @Field(key: .email)
    var email: String
    
    @Field(key: .sport)
    var sport: String
    
    @Field(key: .leagueName)
    var leagueName: String //Add to Freeform
    
    @Field(key: .coachTitle)
    var coachTitle: String
    
    @Field(key: .isAvailable)
    var isAvailable: Bool
        
    @Field(key: .teamName)
    var teamName: String //Add to Freeform
    
    @Field(key: .teamGender)
    var teamGender: String //Add to Freeform
    
    @OptionalField(key: .institutionName)
    var institutionName: String? //Add to Freeform
    
    @OptionalField(key: .leagueDivision)
    var leagueDivision: String? //Add to Freeform
    
    @OptionalField(key: .season)
    var season: String?
    
    @OptionalField(key: .badgeStyle)
    var badgeStyle: String?
    
    @OptionalField(key: .badgeSize)
    var badgeSize: String?
    
    @OptionalField(key: .phoneNumber)
    var phoneNumber: String?
    
    @OptionalField(key: .age)
    var age: Int?
    
    @OptionalField(key: .profileImageName)
    var profileImageName: String?
    
    @OptionalField(key: .leagueImageName)
    var leagueImageName: String? //Add to Freeform
    
    @OptionalField(key: .reasonWhy)
    var reasonWhy: String? //Add to Freeform
    
    @OptionalField(key: .nationality)
    var nationality: String?
    
    @OptionalField(key: .institutionImageName)
    var institutionImageName: String? //Add to Freeform
    
    @Timestamp(key: .createdAt, on: .create, format: .iso8601)
    var createdAt: Date?
    
    @Timestamp(key: .updatedAt, on: .update, format: .iso8601)
    var updatedAt: Date?
    
    @OptionalField(key: .updatedBy)
    var updatedBy: UUID?
    
    public init() {}
    
    public init(id: UUID?, userID: UserModel.IDValue, athleteIDs: [UUID], teamID: UUID, leagueID: UUID, name: String, lastName: String, email: String, sport: String, leagueName: String, coachTitle: String, isAvailable: Bool, teamName: String, teamGender: String, institutionName: String?, leagueDivision: String?, season: String?, badgeStyle: String?, badgeSize: String?, phoneNumber: String?, age: Int?, profileImageName: String?, leagueImageName: String?, reasonWhy: String?, nationality: String?, institutionImageName: String?, createdAt: Date?, updatedAt: Date?, updatedBy: UUID?) {
        self.$user.id = userID
        self.id = id
        self.athleteIDs = athleteIDs
        self.teamID = teamID
        self.leagueID = leagueID
        self.name = name
        self.lastName = lastName
        self.email = email
        self.sport = sport
        self.leagueName = leagueName
        self.coachTitle = coachTitle
        self.isAvailable = isAvailable
        self.teamName = teamName
        self.teamGender = teamGender
        self.institutionName = institutionName
        self.leagueDivision = leagueDivision
        self.season = season
        self.badgeStyle = badgeStyle
        self.badgeSize = badgeSize
        self.phoneNumber = phoneNumber
        self.age = age
        self.profileImageName = profileImageName
        self.leagueImageName = leagueImageName
        self.reasonWhy = reasonWhy
        self.nationality = nationality
        self.institutionImageName = institutionImageName
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.updatedBy = updatedBy
    }
}
