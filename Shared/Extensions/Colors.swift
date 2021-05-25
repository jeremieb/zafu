//
//  Colors.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI

extension Color {
    
    /// Background colors
    static let backgroundMain = Color("backgroundMain")
    static let backgroundBlue = Color("backgroundBlue")
    static let backgroundGreen = Color("backgroundGreen")
    static let backgroundPink = Color("backgroundPink")
    static let backgroundYellow = Color("backgroundYellow")
    
    /// UI Elements
    static let elementSecondary = Color("elementSecondary")
    static let tabbar = Color("tabbar")
    
    /// Colors
    static let textPurple = Color("textPurple")
    static let myPink = Color("myPink")
    static let topSession = Color("topSession")
}

/// Ramdom color
extension UIColor {
    static func random(from colors: [UIColor]) -> UIColor? {
        return colors.randomElement()
    }
}
