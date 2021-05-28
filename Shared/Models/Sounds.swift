//
//  Sounds.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 28/05/2021.
//

import Foundation

struct Sounds: Hashable {
    
    var id: Int
    var name: String
    var file: String
    var color: String
    var image: String?
    
}

let soundFiles: [Sounds] = [
    Sounds(id: 0, name: "No Sound", file: "", color: "elementSecondary", image: "speaker.slash.fill"),
    Sounds(id: 1, name: "Birds in the jungle", file: "birds-in-the-jungle.m4a", color: "backgroundGreen", image: "leaf.fill"),
    Sounds(id: 2, name: "Birds near the river", file: "birds-chirping-near-the-river.m4a", color: "backgroundYellow", image: "hare.fill")
]
