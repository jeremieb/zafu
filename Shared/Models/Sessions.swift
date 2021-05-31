//
//  Sessions.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 15/05/2021.
//

import SwiftUI

struct CustomSession: Identifiable {
    var id = UUID()
    var title: String
    var duration: Int
    var icon: String?
    var color: Color
}

struct LocalSession: Identifiable {
    var id = UUID()
    var title: String
    var duration: Int
    var description: String
    var color: Color
}
