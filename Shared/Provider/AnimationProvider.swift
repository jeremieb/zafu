//
//  AnimationProvider.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI

class AnimationProvider: ObservableObject {
    
    let offset: CGSize
    let frameHeightRatio: CGFloat
    
    init() {
        frameHeightRatio = CGFloat.random(in: 0.7 ..< 1.4)
        offset = CGSize(width: CGFloat.random(in: -150..<150), height: CGFloat.random(in: -150..<150))
    }
}
