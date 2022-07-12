//
//  File.swift
//  
//
//  Created by Wesley Mitchell on 6/8/22.
//

import Foundation
import Combine

public class RemoteConfigLoader: RemoteConfigLoading {
    
    public init() {}
    
    public func fetch() -> AnyPublisher<AppConfig, Error> {
        let configUrl = URL(string: "https://s3.eu-central-1.amazonaws.com/com.donnywals.blog/config.json")!

        return URLSession.shared.dataTaskPublisher(for: configUrl)
          .map(\.data)
          .decode(type: AppConfig.self, decoder: JSONDecoder())
          .eraseToAnyPublisher()
    }
}
