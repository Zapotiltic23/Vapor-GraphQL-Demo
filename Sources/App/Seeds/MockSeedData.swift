//
//  MockSeedData.swift
//
//
//  Created by Horacio Alexandro Sanchez on 4/28/24.
//

import Foundation
import Vapor
import Fluent

struct MockSeedData {
    static let shared: MockSeedData = MockSeedData()
    
    let athleteID: UUID = UUID()
    let athleteUserID: UUID = UUID()
    let coachUserID: UUID = UUID()
    let teamID: UUID = UUID()
    let coachID: UUID = UUID()
    let leagueID: UUID = UUID()
    let adminID: UUID = UUID()
    
    let drill1_ID: UUID = UUID()
    let drill2_ID: UUID = UUID()
    let drill3_ID: UUID = UUID()
    let drill4_ID: UUID = UUID()
    let drill5_ID: UUID = UUID()
    
    
    
    func buildUserSeeds() -> [UserModel] {
        let athleteUser: UserModel = .init(
            id: athleteUserID,
            name: "Andres",
            lastName: "Iniesta",
            email: "horacio@matrixnumerics.com",
            passwordHash: "0123456789",
            userRole: "athlete",
            dateOfBirth: "April 23, 2006",
            deviceIDs: [],
            hasRegisteredRole: true,
            updatedBy: nil,
            userName: "AndresIniesta23")
        
        let coachUser: UserModel = .init(
            id: coachUserID,
            name: "Horacio",
            lastName: "Sanchez",
            email: "horacio@matrixnumerics2.com",
            passwordHash: "0123456789",
            userRole: "coach",
            dateOfBirth: "April 1, 1990",
            deviceIDs: [],
            hasRegisteredRole: true,
            updatedBy: nil,
            userName: "Zapotiltic23")
        
        return [athleteUser, coachUser]
    }
    
    func buildCoachSeed() -> CoachModel {
        let coach: CoachModel = .init(id: coachID,
                                      userID: coachUserID,
                                      athleteIDs: [],
                                      teamID: teamID,
                                      leagueID: leagueID,
                                      name: "Sonora High School",
                                      lastName: "(562) 315-3212",
                                      email: "horacio@matrixnumerics.com",
                                      sport: "soccer",
                                      leagueName: "Freeway League",
                                      coachTitle: "Assitant Coach",
                                      isAvailable: true,
                                      teamName: "Sonora FC",
                                      teamGender: "Men",
                                      institutionName: "Sonora High School",
                                      leagueDivision: "Division II",
                                      season: "Winter 2023",
                                      badgeStyle: "large",
                                      badgeSize: "fire",
                                      phoneNumber: "(562) 315-3212",
                                      age: 34,
                                      profileImageName: "profile_image",
                                      leagueImageName: "profile_image",
                                      reasonWhy: "Reason why here ....",
                                      nationality: "Mexican",
                                      institutionImageName: "Sonora High School",
                                      createdAt: .now,
                                      updatedAt: .now,
                                      updatedBy: UUID())
        return coach
    }
    
    func buildAthleteSeed() -> AthleteModel {
        let athlete: AthleteModel = .init(
            id: athleteID,
            userID: athleteUserID,
            coachIDs: [coachID],
            drillIDs: [drill1_ID,drill2_ID,drill3_ID,drill4_ID,drill5_ID],
            teamID: teamID,
            leagueID: leagueID,
            name: "Horacio Player",
            lastName: "Sanchez",
            email: "horacio@matrixnumerics.com",
            athleteNumber: 23,
            position: "Forward",
            sport: "Soccer",
            leagueName: "Freeway League",
            leagueDivision: "Division IV",
            isAvailable: true,
            isCaptain: true,
            isInjured: true,
            isSuspended: true,
            season: "Fall",
            teamName: "Sonora",
            teamGender: "Men",
            badgeStyle: "Perron",
            badgeSize: "Large",
            leagueImageName: "league_image",
            reasonWhy: "Long reason why here .....",
            institutionName: "Sonora High School",
            clubName: "Barcelna FC",
            nationality: "Mexican",
            age: 34,
            nickname: "El Grande",
            profileImageName: "profile_image", 
            institutionImageName: "profile_image",
            grade: "Senior",
            updatedBy: adminID,
            gpa: 4.0,
            phoneNumber: "(562) 315-3212",
            createdAt: .now,
            updatedAt: .now)
        
        return athlete
    }
    
    func buildDrillSeeds() -> [DrillModel] {
        
        let drill1: DrillModel = .init(id: drill1_ID, athleteID: athleteID, name: "15 yard Sprint", recordedMeasure: 4.56, unitOfMeasure: "seconds", drillType: "pace", createdAt: "March 23, 1990")
        let drill2: DrillModel = .init(id: drill2_ID, athleteID: athleteID, name: "15 yard Sprint", recordedMeasure: 4.56, unitOfMeasure: "seconds", drillType: "pace", createdAt: "March 23, 1990")
        let drill3: DrillModel = .init(id: drill3_ID, athleteID: athleteID, name: "15 yard Sprint", recordedMeasure: 4.56, unitOfMeasure: "seconds", drillType: "pace", createdAt: "March 23, 1990")
        let drill4: DrillModel = .init(id: drill4_ID, athleteID: athleteID, name: "15 yard Sprint", recordedMeasure: 4.56, unitOfMeasure: "seconds", drillType: "pace", createdAt: "March 23, 1990")
        let drill5: DrillModel = .init(id: drill5_ID, athleteID: athleteID, name: "15 yard Sprint", recordedMeasure: 4.56, unitOfMeasure: "seconds", drillType: "pace", createdAt: "March 23, 1990")
        
        return [drill1,drill2,drill3,drill4,drill5]
    }
    
}
