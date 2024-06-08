//
//  DrillModel.swift
//
//
//  Created by Horacio Alexandro Sanchez on 9/6/23.
//

import Foundation
import Fluent
import Vapor

final class DrillModel: Model, Content {
    
    static let schema = Constants.ModelSchema.drill_schema
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: .athleteID)
    var athlete: AthleteModel
    
    @Field(key: .name)
    var name: String
        
    @Field(key: .recordedMeasure)
    var recordedMeasure: Double
    
    @Field(key: .unitOfMeasure)
    var unitOfMeasure: String
    
    @Field(key: .drillType)
    var drillType: String
    
    @Field(key: .drillSport)
    var drillSport: String
    
    @Timestamp(key: .createdAt, on: .create, format: .iso8601)
    var createdAt: Date?
    
    @OptionalField(key: .updatedBy)
    var updatedBy: UUID?
    
    @Timestamp(key: .updatedAt, on: .update, format: .iso8601)
    var updatedAt: Date?
    
    public init() {}
    
    public init(id: UUID?, athleteID: AthleteModel.IDValue, name: String, recordedMeasure: Double, unitOfMeasure: String, drillType: String, drillSport: String, createdAt: Date?, updatedAt: Date?, updatedBy: UUID?) {
        self.id = id
        self.$athlete.id = athleteID
        self.name = name
        self.recordedMeasure = recordedMeasure
        self.unitOfMeasure = unitOfMeasure
        self.drillType = drillType
        self.drillSport = drillSport
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.updatedBy = updatedBy
    }
}

