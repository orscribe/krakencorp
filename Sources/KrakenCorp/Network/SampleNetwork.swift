//
//  File.swift
//  
//
//  Created by wesley Mitchell on 2/15/22.
//

import Foundation
import KrakenCommon

public struct SampleNetwork : KrakenNetwork {
    public init(auth: KrakenAuthentication, config: KrakenConfiguration) {
        let x = ""
    }
}

extension KrakenNetwork {
    public func Vehicles() -> VehiclesRepository {
        return RepositoryFactory.create()
    }
}
