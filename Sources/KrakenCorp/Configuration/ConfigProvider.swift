//
//  File.swift
//  
//
//  Created by Wesley Mitchell on 6/8/22.
//

import Foundation
import Combine

public class ConfigProvider {

    private(set) var config: AppConfig
    private var cancellable: AnyCancellable?
    private var syncQueue = DispatchQueue(label: "config_queue_\(UUID().uuidString)")

    private let localConfigLoader: LocalConfigLoading
    private let remoteConfigLoader: RemoteConfigLoading

    public init(localConfigLoader: LocalConfigLoading, remoteConfigLoader: RemoteConfigLoading) {
        self.localConfigLoader = localConfigLoader
        self.remoteConfigLoader = remoteConfigLoader

        config = localConfigLoader.fetch()
    }

    public func updateConfig() {
        syncQueue.sync {
            guard self.cancellable == nil else {
                return
            }

        self.cancellable = self.remoteConfigLoader.fetch()
              .sink(receiveCompletion: { completion in
              // clear cancellable so we could start a new load
              self.cancellable = nil
          }, receiveValue: { [weak self] in
              self?.config = $0
              self?.localConfigLoader.persist($0)
          })
        }
    }
}
