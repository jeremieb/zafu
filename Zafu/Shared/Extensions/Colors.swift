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
    
    /// Gradient colors
    static let gradientStart = Color("gradient-start")
    static let gradientEnd = Color("gradient-end")
    
}

public let gradientBackground = Gradient(colors: [.gradientStart, .gradientEnd])
