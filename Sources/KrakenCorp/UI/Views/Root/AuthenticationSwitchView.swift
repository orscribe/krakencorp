//
//  SwiftUIView.swift
//  
//
//  Created by wesley Mitchell on 2/8/22.
//

import SwiftUI
import KrakenCommon

public struct AuthenticationSwitchView: View {
    
    @EnvironmentObject var krakenApp: KrakenApp
    @ObservedObject private(set) var viewModel: AuthenticationSwitchViewModel
    
    public init(viewModel: AuthenticationSwitchViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        content
    }
    
    public var content: some View {
        switch viewModel.isAuthenticated {
            case true: return AnyView(VehiclesView(repo: krakenApp.Network.Vehicles()))
            case false: return AnyView(LoginView(title: "Corp corp",
                                                 subTitle: "Sample App",
                                                 bg: krakenApp.Theme.Images.BackgroundImage,
                                                 action: viewModel.updateAuthenticated))
        }
    }
}
