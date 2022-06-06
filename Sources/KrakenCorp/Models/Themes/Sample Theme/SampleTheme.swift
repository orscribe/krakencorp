//
//  SampleTheme.swift
//  KrakenCorp
//
//  Created by wesley Mitchell on 8/11/21.
//

import Foundation
import SwiftUI
import KrakenCommon

public struct SampleTheme: KrakenTheme {
    
    public var Colors: KrakenColors
    public var Layout: KrakenLayout
    public var Typography: KrakenTypography
    public var Images : KrakenImages

    public init() {
        self.Colors = SampleColors()
        self.Layout = StandardLayout()
        self.Typography = StandardTypography()
        self.Images = SampleImages()
    }
}

public struct SampleImages: KrakenImages {
    public var BackgroundImage: Image
    
    init() {
        BackgroundImage = Image(uiImage: UIImage(named: "TrackerBG", in: Bundle.module, compatibleWith: nil)!)
    }
}
