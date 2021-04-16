//
//  Colors.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 02/02/2021.
//

import Foundation
import SwiftUI

extension Color {
    
    /// Primary colors
    static let mainColor = Color("main")
    static let secondaryColor = Color("secondary")
    static let shapesColor = Color("shapes")
    
    /// Background colors
    static let modalBackground = Color("modalBackground")
    
    /// Gradient colors
    static let gradientStart = Color("gradient-start")
    static let gradientEnd = Color("gradient-end")
    
    /// Text specific colors
    static let headersColor = Color("headerColor")
    
    /// Inverted color for buttons
    static let invertedColor = Color("inverted")
    
    /// Buttons background
    static let buttonBackground = Color("button")
    
}

public let gradientBackground = Gradient(colors: [.gradientStart, .gradientEnd])
