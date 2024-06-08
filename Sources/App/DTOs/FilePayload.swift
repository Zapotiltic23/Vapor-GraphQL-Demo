//
//  FilePayload.swift
//
//
//  Created by Horacio Alexandro Sanchez on 6/1/24.
//

import Foundation
import Vapor

struct FilePayload: Content {
    
    var id: UUID?
    var ownerId: UUID?
    var fileType: String?
    var fileData: Data?
    var fileName: String
    var createdAt: String?
    
    init(id: UUID?, ownerId: UUID?, fileType: String?, fileData: Data?, fileName: String, createdAt: String?) {
        self.id = id
        self.ownerId = ownerId
        self.fileType = fileType
        self.fileData = fileData
        self.fileName = fileName
        self.createdAt = createdAt
    }
}
