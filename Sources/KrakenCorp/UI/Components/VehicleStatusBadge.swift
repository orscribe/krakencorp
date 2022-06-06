//
//  VehicleStatusBadge.swift
//  KrakenCorp
//
//  Created by wesley Mitchell on 8/11/21.
//

import SwiftUI
import KrakenCommon

struct VehicleStatusBadge: View {
    
    @EnvironmentObject var krakenApp: KrakenApp
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 11))
            .lineLimit(1)
            .fixedSize()
            .padding(EdgeInsets(top: 2, leading: 12, bottom: 2, trailing: 12))
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(krakenApp.Theme.Colors.Neutral.NeutralFive))
    }
}
