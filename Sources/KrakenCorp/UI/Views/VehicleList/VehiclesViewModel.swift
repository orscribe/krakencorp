//
//  VehiclesViewModel.swift
//  KrakenCorp
//
//  Created by wesley Mitchell on 8/11/21.
//

import Foundation
import Combine
import KrakenCommon

extension VehiclesView {
    class VehiclesViewModel : ObservableObject {
        @Published var vehicles: Loadable<[Vehicle]>
        var cancellationToken: AnyCancellable?
        var vehiclesRepo: VehiclesRepository
        
        init(repo: VehiclesRepository, vehicles: Loadable<[Vehicle]> = .notRequested) {
            vehiclesRepo = repo
            _vehicles = .init(initialValue: vehicles)
        }
        
        func loadVehicles() {
            reloadVehicles(vehiclesSubject: loadableSubject(\.vehicles))
        }
        
        func reloadVehicles(vehiclesSubject: LoadableSubject<[Vehicle]>) {
            let cancelBag = CancelBag()
            vehiclesSubject.wrappedValue.setIsLoading(cancelBag: cancelBag)
            
            cancellationToken = vehiclesRepo.loadVehicles()
                .mapError({ (error) -> Error in
                    print(error)
                    self.vehicles = .failed(error)
                    return error
                })
                .sink(receiveCompletion: { _ in },
                      receiveValue: {
                        self.vehicles = .loaded($0)
                })
        }
    }
}
