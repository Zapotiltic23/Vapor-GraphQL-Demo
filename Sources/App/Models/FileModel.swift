//
//  FileModel.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/1/24.
//

import Foundation
import Fluent
import Vapor

final class FileModel: Model, Content {
    
    static let schema = Constants.ModelSchema.file_schema
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: .ownerId)
    var ownerId: UUID
    
    @Field(key: .fileType)
    var fileType: String
    
    @OptionalField(key: .fileData)
    var fileData: Data?
    
    @Field(key: .fileName)
    var fileName: String
    
    @Field(key: .createdAt)
    var createdAt: String?
    
    init() {}
    
    init(id: UUID?, ownerId: UUID, fileType: String, fileData: Data?, fileName: String, createdAt: String?) {
        self.id = id
        self.ownerId = ownerId
        self.fileType = fileType
        self.fileData = fileData
        self.fileName = fileName
        self.createdAt = createdAt
    }
}

