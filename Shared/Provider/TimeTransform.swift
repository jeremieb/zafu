//
//  TimeTransform.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/05/2021.
//

import Foundation

func timeString(time: Int) -> (hours: String, minutes: String, seconds: String) {
    let hours   = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60

    return ("\(hours)", "\(minutes)", "\(seconds)")
}
