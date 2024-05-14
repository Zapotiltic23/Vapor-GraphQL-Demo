//
//  LoginPayload.swift
//
//
//  Created by Horacio Alexandro Sanchez on 5/3/24.
//

import Foundation
import Vapor

struct LoginPayload: Content {
    
    var email: String
    var password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
