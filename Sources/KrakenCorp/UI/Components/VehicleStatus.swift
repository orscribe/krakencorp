//
//  KrakenStatus.swift
//  KrakenCorp
//
//  Created by wesley Mitchell on 8/11/21.
//

import SwiftUI
import KrakenCommon

struct VehicleStatus: View {
    
    @EnvironmentObject var krakenApp: KrakenApp
    let event: Event

    public init(event: Event) {
        self.event = event
    }
    
    var body: some View {
        HStack {
            switch(event.color) {
                case "blue":
                    Circle()
                        .fill(krakenApp.Theme.Colors.Semantic.Information)
                        .frame(width: 15, height: 15)
                case "green":
                    Circle()
                        .fill(krakenApp.Theme.Colors.Semantic.Success)
                        .frame(width: 15, height: 15)
                case "orange":
                    Circle()
                        .fill(krakenApp.Theme.Colors.Semantic.Warning)
                        .frame(width: 15, height: 15)
                case "red":
                    Circle()
                        .fill(krakenApp.Theme.Colors.Semantic.Error)
                        .frame(width: 15, height: 15)
                case "grey":
                    Circle()
                        .fill(krakenApp.Theme.Colors.Neutral.NeutralSix)
                        .frame(width: 15, height: 15)
                default:
                     Circle()
                        .fill(Color.blue)
                        .frame(width: 15, height: 15)
            }
            Text(event.status)
                .font(.system(size: 15))
            VehicleStatusBadge(text: event.source)
                .padding(.leading, 2)
        }
    }
}
