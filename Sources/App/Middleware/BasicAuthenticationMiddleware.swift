//
//  BasicAuthenticationMiddleware.swift
//
//
//  Created by Horacio Alexandro Sanchez on 5/23/24.
//

import Foundation
import Vapor
import Fluent

struct BasicAuthenticationMiddleware: AsyncBasicAuthenticator {
    
    // Called when an incoming request contains the Authorization: Basic ... header.
    func authenticate(basic: BasicAuthorization, for request: Request) async throws {
        
        guard let user = try await UserModel.query(on: request.db)
            .filter(\.$email == basic.username) //username = email for us!
            .first() else {
            throw Abort(.unauthorized, reason: "Invalid email")
        }
        guard try user.verify(password: basic.password) else {
            throw Abort(.unauthorized, reason: "Invalid password")
        }
        
        /*
         [1] Authenticates the verified user with the supplied credentials for this request.
             If authentication is successful, the authenticator adds the verified user to req.auth.
             This user can then be accessed using req.auth.get(_:) in routes protected by the authenticator.
         */
        request.auth.login(user)
    }
}
