//
//  DrillPayload.swift
//
//  Created by Horacio Alexandro Sanchez on 9/6/23.
//

import Foundation
import Vapor

public struct DrillPayload: Content {
    
    var id: UUID?
    var athleteID: UUID?
    var name: String?
    var recordedMeasure: Double?
    var unitOfMeasure: String?
    var drillType: String?
    var drillSport: String?
    var createdAt: Date?
    var updatedAt: Date?
    var updatedBy: UUID?
    
    public init(id: UUID?, athleteID: UUID?, name: String?, recordedMeasure: Double?, unitOfMeasure: String?, drillType: String?, drillSport: String?, createdAt: Date?, updatedAt: Date?, updatedBy: UUID?) {
        self.id = id
        self.athleteID = athleteID
        self.name = name
        self.recordedMeasure = recordedMeasure
        self.unitOfMeasure = unitOfMeasure
        self.drillSport = drillSport
        self.drillType = drillType
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.updatedBy = updatedBy
    }
}
