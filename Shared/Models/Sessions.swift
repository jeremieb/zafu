//
//  Sessions.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 15/05/2021.
//

import Foundation

struct CustomSession: Identifiable {
    var id = UUID()
    var title: String
    var duration: Int
    var icon: String?
}

struct Session: Identifiable {
    var id = UUID()
    var title: String
    var duration: Int
    var description: String
}
