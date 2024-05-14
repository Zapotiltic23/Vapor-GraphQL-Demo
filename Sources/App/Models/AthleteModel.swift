//
//  AthleteModel.swift
//
//
//  Created by Horacio Alexandro Sanchez on 8/27/23.
//

import Foundation
import Fluent
import Vapor

final class AthleteModel: Model, Content {
    
    static let schema = Constants.ModelSchema.athlete_schema
        
    //MARK: Relations
    
    @Parent(key: .userID)
    var user: UserModel
    
    @Siblings(
        through: CoachAthletePivot.self,
        from: \.$athlete,
        to: \.$coach)
    var coaches: [CoachModel]
    
    @Children(for: \.$athlete)
    var drills: [DrillModel]
    
    
    //MARK: Fields
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .coachIDs)
    var coachIDs: [UUID]
    
    @Field(key: .drillIDs)
    var drillIDs: [UUID]
    
    @Field(key: .teamID)
    var teamID: UUID
    
    @Field(key: .leagueID)
    var leagueID: UUID
    
    @Field(key: .name)
    var name: String
    
    @Field(key: .lastName)
    var lastName: String
    
    @OptionalField(key: .email)
    var email: String?
        
    @OptionalField(key: .athleteNumber)
    var athleteNumber: Int?
    
    @OptionalField(key: .position)
    var position: String?
    
    @Field(key: .sport)
    var sport: String
    
    @Field(key: .leagueName)
    var leagueName: String
    
    @OptionalField(key: .leagueDivision)
    var leagueDivision: String?
    
    @Field(key: .isAvailable)
    var isAvailable: Bool
    
    @Field(key: .isCaptain)
    var isCaptain: Bool
    
    @Field(key: .isInjured)
    var isInjured: Bool
    
    @Field(key: .isSuspended)
    var isSuspended: Bool
    
    @OptionalField(key: .season)
    var season: String?
    
    @Field(key: .teamName)
    var teamName: String
    
    @Field(key: .teamGender)
    var teamGender: String
    
    @OptionalField(key: .badgeStyle)
    var badgeStyle: String?
    
    @OptionalField(key: .badgeSize)
    var badgeSize: String?
    
    @OptionalField(key: .leagueImageName)
    var leagueImageName: String?
    
    @OptionalField(key: .reasonWhy)
    var reasonWhy: String?
    
    @OptionalField(key: .institutionName)
    var institutionName: String?
    
    @OptionalField(key: .clubName)
    var clubName: String?
    
    @OptionalField(key: .nationality)
    var nationality: String?
    
    @OptionalField(key: .age)
    var age: Int?
    
    @OptionalField(key: .nickname)
    var nickname: String?
    
    @OptionalField(key: .profileImageName)
    var profileImageName: String?
    
    @OptionalField(key: .grade)
    var grade: String?
    
    @OptionalField(key: .updatedBy)
    var updatedBy: UUID?
    
    @OptionalField(key: .gpa)
    var gpa: Double?
    
    @OptionalField(key: .institutionImageName)
    var institutionImageName: String? //Add to Freeform
    
    @OptionalField(key: .phoneNumber)
    var phoneNumber: String?
    
    @Timestamp(key: .createdAt, on: .create, format: .iso8601)
    var createdAt: Date?
    
    @Timestamp(key: .updatedAt, on: .update, format: .iso8601)
    var updatedAt: Date?
    
    public init() {}
    
    init(id: UUID?, userID: UserModel.IDValue, coachIDs: [UUID], drillIDs: [UUID], teamID: UUID, leagueID: UUID, name: String, lastName: String, email: String?, athleteNumber: Int?, position: String?, sport: String, leagueName: String, leagueDivision: String?, isAvailable: Bool, isCaptain: Bool, isInjured: Bool, isSuspended: Bool, season: String?, teamName: String, teamGender: String, badgeStyle: String?, badgeSize: String?, leagueImageName: String?, reasonWhy: String?, institutionName: String?, clubName: String?, nationality: String?, age: Int?, nickname: String?, profileImageName: String?, institutionImageName: String?, grade: String?, updatedBy: UUID?, gpa: Double?, phoneNumber: String?, createdAt: Date?, updatedAt: Date?) {
        self.id = id
        self.$user.id = userID
        self.coachIDs = coachIDs
        self.drillIDs = drillIDs
        self.teamID = teamID
        self.leagueID = leagueID
        self.name = name
        self.lastName = lastName
        self.email = email
        self.athleteNumber = athleteNumber
        self.position = position
        self.sport = sport
        self.leagueName = leagueName
        self.leagueDivision = leagueDivision
        self.isAvailable = isAvailable
        self.isCaptain = isCaptain
        self.isInjured = isInjured
        self.isSuspended = isSuspended
        self.season = season
        self.teamName = teamName
        self.teamGender = teamGender
        self.badgeStyle = badgeStyle
        self.badgeSize = badgeSize
        self.leagueImageName = leagueImageName
        self.reasonWhy = reasonWhy
        self.institutionName = institutionName
        self.clubName = clubName
        self.nationality = nationality
        self.age = age
        self.nickname = nickname
        self.profileImageName = profileImageName
        self.grade = grade
        self.updatedBy = updatedBy
        self.gpa = gpa
        self.phoneNumber = phoneNumber
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.institutionImageName = institutionImageName
    }
}
