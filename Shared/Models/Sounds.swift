//
//  Sounds.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 28/05/2021.
//

import Foundation
import SwiftUI

/// Soundscape
struct Sounds: Hashable {
    var id: Int
    var name: String
    var file: String
    var color: Color
    var image: String?
}

let soundFiles: [Sounds] = [
    Sounds(id: 1, name: "Birds in the jungle", file: "birds-in-the-jungle.m4a", color: Color.mainSky, image: "leaf"),
    Sounds(id: 2, name: "Birds near the river", file: "birds-chirping-near-the-river.m4a", color: Color.mainPink, image: "hare"),
    /// NO SOUND - KEEP AT THE END
    Sounds(id: 0, name: "No \n Sound", file: "", color: Color(UIColor.systemGray3), image: "speaker.slash")
]

/// Bells & Gongs
struct Bells: Hashable {
    var id: Int
    var name: String
    var color: Color
    var file: String
}

let bellFiles: [Bells] = [
    Bells(id: 0, name: "Achievement", color: Color.mainLightBlue, file: "achievement-bell.wav"),
    Bells(id: 1, name: "Metal Gong", color: Color.mainDarkPink, file: "metal_gong.wav"),
    Bells(id: 2, name: "Fairy", color: Color.mainOrange, file: "fairy-bell.wav")
]
