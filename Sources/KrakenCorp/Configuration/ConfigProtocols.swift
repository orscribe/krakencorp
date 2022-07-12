//
//  File.swift
//  
//
//  Created by Wesley Mitchell on 6/8/22.
//

import Foundation
import Combine

public protocol LocalConfigLoading {
  func fetch() -> AppConfig
  func persist(_ config: AppConfig)
}

public protocol RemoteConfigLoading {
  func fetch() -> AnyPublisher<AppConfig, Error>
}

public struct AppConfig: Codable {
  let minVersion: String
}
