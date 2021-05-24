//
//  BackgroundView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Circles()
    }
}

struct Shapes: View {
    
    @State var animated = false
    @StateObject var animationProvider = AnimationProvider()
    @ObservedObject var observer = Observer()
    
    /// Used to define circle position
    let alignment: Alignment
    
    /// User to define circle color
    let color: Color
    
    /// Rotation
    let rotation: Double = Double(.random(in: 0...90))
    let rotationTurn: Double
    
    /// Animation Duration
    let duration: Double
    
    /// Geometry proxy
    let proxy: GeometryProxy
    
    /// Blur
    let blur: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(height: proxy.size.height / animationProvider.frameHeightRatio)
                .offset(animationProvider.offset)
                .rotationEffect(.init(degrees: animated ? rotation : rotation + rotationTurn ))
                .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                .opacity(0.9)
                .blur(radius: blur)
        }.onReceive(self.observer.$enteredForeground) { _ in
            withAnimation {
                animated = true
            }
        }
    }
}

struct Circles: View {

    let blur: CGFloat = 120
    
    var body: some View {
        GeometryReader { proxy in
            ZStack{
                
                /// Background color
                BackgroundDefaultView().opacity(0.3)
                
                Group{
                    // Blue
                    Shapes(
                        alignment: .topTrailing,
                        color: Color.backgroundGreen,
                        rotationTurn: -180,
                        duration: 20,
                        proxy: proxy,
                        blur: blur
                    )
                    
                    // Pink
                    Shapes(
                        alignment: .topLeading,
                        color: Color.backgroundPink,
                        rotationTurn: 360,
                        duration: 30,
                        proxy: proxy,
                        blur: blur
                    )
                    
                    // Green
                    Shapes(
                        alignment: .bottomLeading,
                        color: Color.backgroundYellow,
                        rotationTurn: 360,
                        duration: 20,
                        proxy: proxy,
                        blur: blur
                    )
                    
                    // Yellow
                    Shapes(
                        alignment: .bottomLeading,
                        color: Color.backgroundBlue,
                        rotationTurn: -180,
                        duration: 35,
                        proxy: proxy,
                        blur: blur
                    )
                }
            }.ignoresSafeArea()
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
