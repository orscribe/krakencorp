//
//  SwiftUIView.swift
//  
//
//  Created by wesley Mitchell on 2/8/22.
//

import SwiftUI
import KrakenCommon

struct LoginView: View {
    
    var title: String
    var subTitle: String
    var bg: Image
    var action: () -> Void
    
    var body: some View {
        ZStack {
            bg
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 13) {
                Spacer()
                SmallTitle(text: title)
                KrakenTitle(text: subTitle)
                    .foregroundColor(Color.white)
                Spacer()
                KrakenButton.Primary(label: "Log Me In", action: action)
                Spacer()
            }
        }
    }
}

struct SmallTitle: View {
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 24))
                .fontWeight(.regular)
                .foregroundColor(Color.white)
                .opacity(0.48)
                .multilineTextAlignment(.center)
        }
    }
}
