//
//  ButtonsDefault.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 19/03/2021.
//

import SwiftUI

struct ButtonsDefault: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 17, weight: .heavy, design: .serif))
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, 40.0)
            .padding(.vertical, 16.0)
            .background(Color.buttonBackground)
            .cornerRadius(10)
            .foregroundColor(configuration.isPressed ? .white : .mainColor)
    }
}
