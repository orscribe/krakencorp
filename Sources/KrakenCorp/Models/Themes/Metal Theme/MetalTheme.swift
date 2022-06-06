//
//  File.swift
//  
//
//  Created by wesley Mitchell on 2/8/22.
//

import Foundation
import SwiftUI
import KrakenCommon

public struct MetalTheme: KrakenTheme {
    
    public var Colors: KrakenColors
    public var Layout: KrakenLayout
    public var Typography: KrakenTypography
    public var Images : KrakenImages

    public init() {
        self.Colors = MetalColors()
        self.Layout = StandardLayout()
        self.Typography = MetalTypography()
        self.Images = MetalImages()
    }
}

public struct MetalImages: KrakenImages {
    public var BackgroundImage: Image
    
    init() {
        BackgroundImage = Image(uiImage: UIImage(named: "MetalBG3", in: Bundle.module, compatibleWith: nil)!)
    }
}
