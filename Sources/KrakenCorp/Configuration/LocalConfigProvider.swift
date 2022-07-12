//
//  File.swift
//  
//
//  Created by Wesley Mitchell on 6/8/22.
//

import Foundation
import Combine

public class LocalConfigLoader: LocalConfigLoading {
    public init() {}
    
    private var cachedConfigUrl: URL? {
        guard let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
          return nil
        }

        return documentsUrl.appendingPathComponent("config.json")
    }

    private var cachedConfig: AppConfig? {
        let jsonDecoder = JSONDecoder()

        guard let configUrl = cachedConfigUrl,
              let data = try? Data(contentsOf: configUrl),
              let config = try? jsonDecoder.decode(AppConfig.self, from: data) else {
          return nil
        }

        return config
    }

    private var defaultConfig: AppConfig {
        let jsonDecoder = JSONDecoder()

        guard let url = Bundle.main.url(forResource: "config", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let config = try? jsonDecoder.decode(AppConfig.self, from: data) else {
                  fatalError("Bundle must include default config. Check and correct this mistake.")
              }

        return config
    }

    public func fetch() -> AppConfig {
        if let cachedConfig = self.cachedConfig {
            return cachedConfig
        } else {
            let config = self.defaultConfig
            persist(config)
            return config
        }
    }

    public func persist(_ config: AppConfig) {
        guard let configUrl = cachedConfigUrl else {
        // should never happen, you might want to handle this
        return
    }

    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(config)
        try data.write(to: configUrl)
    } catch {
        // you could forward this error somewhere
        print(error)
    }
  }
}
