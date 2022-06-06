//
//  ContentView.swift
//  KrakenCorp
//
//  Created by wesley Mitchell on 8/11/21.
//

import SwiftUI
import Combine
import KrakenCommon

public struct VehiclesView: View {
    
    @EnvironmentObject var krakenApp: KrakenApp
    @ObservedObject private(set) var viewModel: VehiclesViewModel
    
    public init(repo: VehiclesRepository) {
        self.viewModel = VehiclesViewModel(repo: repo)
    }
    
    public var body: some View {
        KrakenContainer {
            content
        }
    }
    
    private var content: AnyView {
        switch viewModel.vehicles {
            case .notRequested: return AnyView(notRequestedView)
            case .isLoading: return AnyView(loadingView())
            case let .loaded(vehicles): return AnyView(loadedView(vehicles))
            case let .failed(error): return AnyView(failedView(error))
        }
    }
    
}

private extension VehiclesView {
    var notRequestedView: some View {
        Text("").onAppear(perform: self.viewModel.loadVehicles)
    }
    
    func loadingView() -> some View {
        HStack {
            Spacer()
            Spinner(isAnimating: true, style: .large)
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
    
    func loadedView(_ vehicles: [Vehicle]) -> some View {
        VehicleList(vehicles: vehicles)
    }
    
    func failedView(_ error: Error) -> some View {
        ErrorView(error: error, retryAction: {
            self.viewModel.loadVehicles()
        })
    }
}

struct ErrorView: View {
    let error: Error
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text("An Error Occured")
                .font(.title)
            Text(error.localizedDescription)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40).padding()
            Button(action: retryAction, label: { Text("Retry").bold() })
        }
    }
}
