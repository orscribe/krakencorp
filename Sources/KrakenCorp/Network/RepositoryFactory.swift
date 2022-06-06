//
//  RepositoryFactory.swift
//  KrakenCorp
//
//  Created by wesley Mitchell on 8/11/21.
//

import Foundation

public class RepositoryFactory {
    
    private static let baseUrl = "https://run.mocky.io"
    
    /// Functon create a vehicle factory
    /// - Returns: VehiclesRepository.
    public static func create() -> VehiclesRepository {
        return VehiclesRepository(session: configuredURLSession(), baseURL: baseUrl)
    }
    
    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
    
}
