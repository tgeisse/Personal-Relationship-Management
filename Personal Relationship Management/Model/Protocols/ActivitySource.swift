//
//  ActivitySource.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import Foundation

protocol ActivitySource {
    var name: String { get }
    var image: String { get }
    
    var authenticationStatus: ActivitySourceAuthenticationStatus { get }
    var isAuthenticated: Bool { get }
    func authenticate() -> Void
    func deauthenticate() -> Void
}
