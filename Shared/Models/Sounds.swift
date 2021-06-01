//
//  Sounds.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 28/05/2021.
//

import Foundation
import SwiftUI

struct Sounds: Hashable {
    var id: Int
    var name: String
    var file: String
    var color: Color
    var image: String?
}

let soundFiles: [Sounds] = [
    Sounds(id: 1, name: "Birds in the jungle", file: "birds-in-the-jungle.m4a", color: Color.mainSky, image: "leaf.fill"),
    Sounds(id: 2, name: "Birds near the river", file: "birds-chirping-near-the-river.m4a", color: Color.mainPink, image: "hare.fill"),
    /// NO SOUND - KEEP AT THE END
    Sounds(id: 0, name: "No \n Sound", file: "", color: Color(UIColor.systemGray3), image: "speaker.slash.fill")
]
