//
//  RoutesProtocol.swift
//  
//
//  Created by Horacio Alexandro Sanchez on 2/1/23.
//

import Fluent
import Vapor

protocol RoutesProtocol {
    
    associatedtype A: Content
    
    func createModel(req: Request) async throws -> AnalyticsResponse<A>
    func returnAllModels(req: Request) async throws -> AnalyticsResponse<A>
    func updateModel(req: Request) async throws -> AnalyticsResponse<A>
    func deleteByID(req: Request) async throws -> AnalyticsResponse<A>
    func searchModels(req: Request) async throws -> AnalyticsResponse<A>
}
