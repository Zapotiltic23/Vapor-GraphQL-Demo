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
    
    // Users
    let athleteUserID: UUID = UUID()
    let coachUserID: UUID = UUID()
    let visitorOneUserID: UUID = UUID()
    let visitorTwoUserID: UUID = UUID()
    
    // Roles
    let athleteID: UUID = UUID()
    let coachID: UUID = UUID()
    let adminID: UUID = UUID()

    let teamID: UUID = UUID()
    let leagueID: UUID = UUID()
    let drill1_ID: UUID = UUID()
    let drill2_ID: UUID = UUID()
    let drill3_ID: UUID = UUID()
    let drill4_ID: UUID = UUID()
    let drill5_ID: UUID = UUID()
    
    func buildUserSeeds() -> [UserModel] {
        guard let hash:String = try? Bcrypt.hash("0123456789") else {return []}
        
        let athleteUser: UserModel = .init(
            id: athleteUserID,
            name: "Andres",
            lastName: "Iniesta",
            email: "horacio@matrixnumerics.com",
            passwordHash: hash,
            userRole: "athlete",
            dateOfBirth: "April 23, 2006",
            deviceIDs: [],
            hasRegisteredRole: true,
            updatedBy: nil,
            userName: "AndresIniesta23")
        
        let coachUser: UserModel = .init(
            id: coachUserID,
            name: "James",
            lastName: "Rocks",
            email: "horacio@matrixnumerics2.com",
            passwordHash: hash,
            userRole: "coach",
            dateOfBirth: "April 1, 1990",
            deviceIDs: [],
            hasRegisteredRole: true,
            updatedBy: nil,
            userName: "Zapotiltic23")
        
        let visitorOneUser: UserModel = .init(
            id: self.visitorOneUserID,
            name: "James",
            lastName: "Rocks",
            email: "email@yahoo.com",
            passwordHash: hash,
            userRole: "visitor",
            dateOfBirth: "April 1, 1990",
            deviceIDs: [],
            hasRegisteredRole: true,
            updatedBy: nil,
            userName: "JamieDiamond")
        
        let visitorTwoUser: UserModel = .init(
            id: self.visitorTwoUserID,
            name: "Rick",
            lastName: "Morty",
            email: "ricky@yahoo.com",
            passwordHash: hash,
            userRole: "visitor",
            dateOfBirth: "April 1, 1990",
            deviceIDs: [],
            hasRegisteredRole: true,
            updatedBy: nil,
            userName: "RickyRicon")
        
        return [athleteUser, coachUser, visitorOneUser, visitorTwoUser]
    }
    
    func buildCoachSeed() -> CoachModel {
        let coach: CoachModel = .init(
            id: coachID,
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
        
        let drill1: DrillModel = .init(
            id: drill1_ID,
            athleteID: athleteID,
            name: "15 yard Sprint",
            recordedMeasure: 4.56,
            unitOfMeasure: "seconds",
            drillType: "pace", drillSport: "Soccer",
            createdAt: .now, updatedAt: .now, updatedBy: UUID())
        
        let drill2: DrillModel = .init(id: drill2_ID, athleteID: athleteID, name: "15 yard Sprint", recordedMeasure: 4.56, unitOfMeasure: "seconds", drillType: "pace", drillSport: "Soccer", createdAt: .now,  updatedAt: .now, updatedBy: UUID())
        let drill3: DrillModel = .init(id: drill3_ID, athleteID: athleteID, name: "15 yard Sprint", recordedMeasure: 4.56, unitOfMeasure: "seconds", drillType: "pace", drillSport: "Soccer", createdAt: .now,  updatedAt: .now, updatedBy: UUID())
        let drill4: DrillModel = .init(id: drill4_ID, athleteID: athleteID, name: "15 yard Sprint", recordedMeasure: 4.56, unitOfMeasure: "seconds", drillType: "pace", drillSport: "Soccer", createdAt: .now,  updatedAt: .now, updatedBy: UUID())
        let drill5: DrillModel = .init(id: drill5_ID, athleteID: athleteID, name: "15 yard Sprint", recordedMeasure: 4.56, unitOfMeasure: "seconds", drillType: "pace", drillSport: "Soccer", createdAt: .now,  updatedAt: .now, updatedBy: UUID())
        
        return [drill1,drill2,drill3,drill4,drill5]
    }
    
    func buildGameSeed() -> [GameModel] {
        
        let gamePayload1 = GameModel(
            id: UUID(),
            leagueID: UUID(),
            homeTeamID: UUID(),
            awayTeamID: UUID(),
            isCancelled: Bool.random(),
            gameType: randomString(length: 10),
            gameSport: randomString(length: 10),
            gameDate: Date(),
            homeTeamScore: Int.random(in: 0...100), 
            awayTeamScore: 57,
            gameLocation: randomString(length: 15),
            gameDescription: randomString(length: 30),
            updatedBy: UUID(),
            createdAt: Date(),
            updatedAt: Date()
        )
        
        let gamePayload2 = GameModel(
            id: UUID(),
            leagueID: UUID(),
            homeTeamID: UUID(),
            awayTeamID: UUID(),
            isCancelled: Bool.random(),
            gameType: randomString(length: 10),
            gameSport: randomString(length: 10),
            gameDate: Date(),
            homeTeamScore: Int.random(in: 0...100),
            awayTeamScore: 23,
            gameLocation: randomString(length: 15),
            gameDescription: randomString(length: 30),
            updatedBy: UUID(),
            createdAt: Date(),
            updatedAt: Date()
        )
        
        let gamePayload3 = GameModel(
            id: UUID(),
            leagueID: UUID(),
            homeTeamID: UUID(),
            awayTeamID: UUID(),
            isCancelled: Bool.random(),
            gameType: randomString(length: 10),
            gameSport: randomString(length: 10),
            gameDate: Date(),
            homeTeamScore: Int.random(in: 0...100),
            awayTeamScore: 13,
            gameLocation: randomString(length: 15),
            gameDescription: randomString(length: 30),
            updatedBy: UUID(),
            createdAt: Date(),
            updatedAt: Date()
        )
        
        return [gamePayload1,gamePayload2,gamePayload3]
    }
    
    func randomData(length: Int) -> Data? {
        var data = Data(count: length)
        let result = data.withUnsafeMutableBytes {
            SecRandomCopyBytes(kSecRandomDefault, length, $0.baseAddress!)
        }
        return result == errSecSuccess ? data : nil
    }
    
    
    
    func buildFileSeeds() -> [FileModel] {
        
        let filePayload1 = FileModel(
            id: UUID(),
            ownerId: UUID(),
            fileType: randomString(length: 10),
            fileData: randomData(length: 256),
            fileName: randomString(length: 10),
            createdAt: Date().description
        )
        
        let filePayload2 = FileModel(
            id: UUID(),
            ownerId: UUID(),
            fileType: randomString(length: 10),
            fileData: randomData(length: 256),
            fileName: randomString(length: 10),
            createdAt: Date().description
        )
        
        let filePayload3 = FileModel(
            id: UUID(),
            ownerId: UUID(),
            fileType: randomString(length: 10),
            fileData: randomData(length: 256),
            fileName: randomString(length: 10),
            createdAt: Date().description
        )
        
        return [filePayload1,filePayload2,filePayload3]
    }
    
    func buildVisitorSeed() -> [VisitorModel] {
        
        let visitor_1: VisitorModel = VisitorModel(
            id: UUID(),
            userID: self.visitorOneUserID,
            name: "James",
            userName: "JamieDiamond",
            lastName: "Rocks",
            email: "email@yahoo.com",
            teamsFollowed: [],
            leaguesFollowed: [],
            updatedBy: UUID(),
            createdAt: .now,
            updatedAt: .now)
        
        let visitor_2: VisitorModel = VisitorModel(
            id: UUID(),
            userID: self.visitorTwoUserID,
            name: "Rick",
            userName: "RickyRicon",
            lastName: "Morty",
            email: "ricky@yahoo.com",
            teamsFollowed: [],
            leaguesFollowed: [],
            updatedBy: UUID(),
            createdAt: .now,
            updatedAt: .now)
        
        return [visitor_1,visitor_2]
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
