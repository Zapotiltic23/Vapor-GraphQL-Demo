//
//  Extensions.swift
//
//
//  Created by Horacio Alexandro Sanchez on 4/12/24.
//

import Foundation
import Fluent
import Vapor

extension String {
    func toBase64Encoded() -> String? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        return data.base64EncodedString()
    }
}

extension FieldKey {
    
    static var userID: Self { "userID" }
    static var coachID: Self { "coach_id" }
    static var name: Self { "name" }
    static var lastName: Self { "last_name" }
    static var userName: Self { "user_name" }
    static var userRole: Self { "user_role" }
    static var profileImage: Self { "profile_image" }
    static var createdAt: Self { "created_at" }
    static var updatedAt: Self { "updated_at" }
    static var coach: Self { "coach" }
    static var athlete: Self { "athlete" }
    static var athleteID: Self { "athlete_id" }
    static var coachIDs: Self { "coach_ids" }
    static var athleteIDs: Self { "athlete_ids" }
    static var sport: Self { "sport" }
    static var dateOfBirth: Self { "dob" }
    static var leagueName: Self { "league_name" }
    static var leagueDivision: Self { "league_division" }
    static var coachTitle: Self { "coach_title" }
    static var leagueImageName: Self { "league_image_name" }
    static var isAvailable: Self { "is_available" }
    static var isInjured: Self { "is_injured" }
    static var isCaptain: Self { "is_captain" }
    static var isSuspended: Self { "is_suspended" }
    static var hasRegisteredRole: Self { "has_registered_role" }
    static var reasonWhy: Self { "reason_why" }
    static var season: Self { "season" }
    static var teamName: Self { "team_name" }
    static var teamGender: Self { "team_gender" }
    static var badgeStyle: Self { "badge_style" }
    static var badgeSize: Self { "badge_size" }
    
    
    static var athleteNumber: Self { "athlete_number" }
    static var position: Self { "position" }
    static var institutionName: Self { "institution_name" }
    static var institutionImageName: Self { "institution_image_name" }
    static var clubName: Self { "club_name" }
    static var clubImageName: Self { "club_image_name" }
    static var nationality: Self { "nationality" }
    static var teamID: Self { "team_id" }
    static var leagueID: Self { "league_id" }
    static var gameDate: Self { "game_date" }
    static var homeTeamID: Self { "home_team_id" }
    static var awayTeamID: Self { "away_team_id" }
    static var homeTeamScore: Self { "home_team_score" }
    static var awayTeamScore: Self { "away_team_score" }
    static var gameLocation: Self { "game_location" }
    static var gameDescription: Self { "game_description" }
    static var isCancelled: Self { "is_cancelled" }
    static var gameType: Self { "game_type" }
    static var gameSport: Self { "game_sport" }
    static var ownerId: Self { "owner_id" }
    static var fileType: Self { "file_type" }
    static var fileData: Self { "file_data" }
    static var fileName: Self { "file_name" }
    
    static var age: Self { "age" }
    static var nickname: Self { "nickname" }
    static var grade: Self { "grade" }
    static var profileImageName: Self { "profileImageName" }
    static var gpa: Self { "gpa" }
    static var value: Self { "value" }
    static var recordedMeasure: Self { "recorded_measure" }
    static var unitOfMeasure: Self { "unit_of_measure" }
    static var drillIDs: Self { "drill_ids" }
    static var drillType: Self { "drill_type" }
    static var drillSport: Self { "drill_sport" }
    
    
    static var streetNumber: Self { "street_number" }
    static var streetName: Self { "street_name" }
    static var city: Self { "city" }
    static var zipCode: Self { "zip_code" }
    static var state: Self { "state" }
    
    static var phoneNumber: Self { "phone_number" }
    static var email: Self { "email" }
    static var websiteUrl: Self { "website_url" }
    static var socialMedia: Self { "social_media" }
    
    static var passwordHash: Self { "password_hash" }
    static var updatedBy: Self { "updated_by" }
    static var deviceIDs: Self { "device_ids" }
    static var teamsFollowed: Self { "teams_followed" }
    static var leaguesFollowed: Self { "leagues_followed" }
}
