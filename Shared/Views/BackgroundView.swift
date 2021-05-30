//
//  BackgroundView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI

struct BackgroundView: View {
    
    let colors: [Color] = [
        Color.mainOrange,
        Color.mainPink,
        Color.mainBlue,
        Color.mainDarkPink,
        Color.mainLightBlue
    ]
    
    var body: some View {
        ZStack {
            OneCircle(color: colors.randomElement() ?? Color.mainBlue)
            OneCircle(color: colors.randomElement() ?? Color.mainBlue)
        }.ignoresSafeArea()
    }
}

struct OneCircle: View {
    
    @StateObject var animationProvider = AnimationProvider()
    
    @Environment(\.colorScheme) var colorScheme
    
    /// User to define circle color
    let color: Color
    
    /// Alignment
    var alignment: [Alignment] {
        return [
            .topLeading,
            .bottomLeading,
            .topTrailing,
            .bottomTrailing,
            .leading,
            .trailing
        ]
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: UIScreen.main.bounds.size.width / 1.4, height: UIScreen.main.bounds.size.height / animationProvider.frameHeightRatio)
                .offset(animationProvider.offset)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment.randomElement() ?? .topTrailing)
                .opacity(colorScheme == .dark ? 0.3 : 0.950)
                .blur(radius: 120)
        }
    }

}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BackgroundView()
        }
    }
}
