//
//  File.swift
//  
//
//  Created by wesley Mitchell on 5/4/21.
//

import Foundation

public struct Vehicle: Codable, Equatable, Hashable, Identifiable {
    public let id: Int
    public let make: String
    public let model: String
    public let year: String
    public let stockNumber: String
    public let thumbnail: String
    public let events: [Event]
    
    typealias Code = String
}

public struct Event: Codable, Equatable, Hashable {
    public let color: String
    public let status: String
    public let source: String
}
