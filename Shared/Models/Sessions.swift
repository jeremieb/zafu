//
//  Sessions.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 15/05/2021.
//

import SwiftUI

struct LocalFeaturedSession: Identifiable {
    var id = UUID()
    var title: String
    var duration: Int
    var description: String
    var color: Color
    var icon: String
}

/// Fake data
/// Placeholder sessions
let sessions = [
    LocalFeaturedSession(title: "First Session", duration: 15, description: "Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.", color: Color.mainOrange, icon: "leaf"),
    LocalFeaturedSession(title: "Second Session Big Title", duration: 20, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", color: Color.mainOrange, icon: "fire"),
    LocalFeaturedSession(title: "Third Session", duration: 16, description: "Cras justo odio, dapibus ac facilisis in, egestas eget quam.", color: Color.mainOrange, icon: "wind")
]
