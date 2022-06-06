//
//  VehicleRow.swift
//  KrakenCorp
//
//  Created by wesley Mitchell on 8/11/21.
//

import SwiftUI
import KrakenCommon

public struct VehicleRow: View {
    
    @EnvironmentObject var krakenApp: KrakenApp
    let vehicle: Vehicle
    
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage(named: "VehicleThumbnailPlaceholder")!

    public init(vehicle: Vehicle) {
        self.vehicle = vehicle
        imageLoader = ImageLoader(urlString: vehicle.thumbnail)
    }

    public var body: some View {
            HStack(alignment: .top) {
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 93.0, height: 93.0)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .onReceive(imageLoader.didChange) { data in
                        self.image = UIImage(data: data) ?? UIImage() }
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(vehicle.year + " " + vehicle.make + " " + vehicle.model)
                            .fontWeight(.bold)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Text("Stk #  " + vehicle.stockNumber)
                        .font(.system(size: 15))
                    ForEach(self.vehicle.events, id: \.self) { event in
                        VehicleStatus(event: event)
                    }
                }
                .padding(.leading, 10)
                .frame(minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
    }
}
