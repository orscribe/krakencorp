//
//  VehiclesRepository.swift
//  KrakenCorp
//
//  Created by wesley Mitchell on 8/11/21.
//

import Foundation
import Combine
import KrakenCommon

protocol VehiclesWebRepository: WebRepository {
    func loadVehicles() -> AnyPublisher<[Vehicle], Error>
    func loadVehicleDetails(vehicle: Vehicle) -> AnyPublisher<Vehicle, Error>
}

public struct VehiclesRepository: VehiclesWebRepository {
    
    public let session: URLSession
    public let baseURL: String
    public let bgQueue = DispatchQueue(label: "bg_parse_queue")
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    public func loadVehicles() -> AnyPublisher<[Vehicle], Error> {
        return call(endpoint: API.allVehicles)
    }

    func loadVehicleDetails(vehicle: Vehicle) -> AnyPublisher<Vehicle, Error> {
        let request: AnyPublisher<[Vehicle], Error> = call(endpoint: API.vehicleDetails(vehicle))
        return request
            .tryMap { array -> Vehicle in
                guard let details = array.first
                    else { throw APIError.unexpectedResponse }
                return details
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Endpoints

extension VehiclesRepository {
    enum API {
        case allVehicles
        case vehicleDetails(Vehicle)
    }
}

//This needs to be reformatted to our endpoint. Sample endpoints only usually let you call by ID, not by name.
extension VehiclesRepository.API: APICall {
    var path: String {
        switch self {
        case .allVehicles:
            return "/v3/08252de6-a7ad-488b-b3eb-f7ea7b3f34e6"
        case let .vehicleDetails(vehicle):
            let encodedName = vehicle.make.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return "/name/\(encodedName ?? vehicle.make)"
        }
    }
    var method: String {
        switch self {
        case .allVehicles, .vehicleDetails:
            return "GET"
        }
    }
    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
    func body() throws -> Data? {
        return nil
    }
}
