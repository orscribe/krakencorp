//
//  File.swift
//  
//
//  Created by wesley Mitchell on 2/8/22.
//

import Foundation
import KrakenCommon

public class AuthenticationSwitchViewModel : ObservableObject {
    @Published var isAuthenticated: Bool = false
    var app: KrakenAuthentication
    
    public init(auth: KrakenAuthentication) {
        self.app = auth
    }
    
    func updateAuthenticated() {
        self.isAuthenticated = true
    }
}
