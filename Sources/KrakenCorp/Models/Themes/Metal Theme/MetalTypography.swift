//
//  File.swift
//  
//
//  Created by wesley Mitchell on 2/8/22.
//

import SwiftUI
import KrakenCommon

public struct MetalTypography: KrakenTypography {
    
    public let Title: KrakenFont
    public let SubTitle: KrakenFont
    public let Body: KrakenFont
    public let Button: KrakenFont
    
    public init() {
        self.Title = KrakenFont(typeFace: "Marker Felt Wide", size: 70, lineSpacing: 8)
        self.SubTitle = KrakenFont(typeFace: "Helvetica Neue", size: 25, lineSpacing: 8)
        self.Body = KrakenFont(typeFace: "Helvetica Neue", size: 16, lineSpacing: 12)
        self.Button = KrakenFont(typeFace: "Helvetica Neue", size: 20, lineSpacing: 8)
    }
}
