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
    
    @ObservedObject var motion = MotionProvider()
    
    @StateObject var animationProvider = AnimationProvider()
    
    /// Used to define circle position
    let alignment: Alignment
    
    /// User to define circle color
    let color: Color
    
    /// Rotation
    let rotation: Double = Double(.random(in: 0...90))
    
    /// Animation Duration
    let duration: Double
    
    /// Geometry proxy
    let proxy: GeometryProxy
    
    /// Blur
    let blur: CGFloat
    
    /// Motion Calculator
    var motionCalculator: Int {
        return Int(motion.pitch)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(height: proxy.size.height / animationProvider.frameHeightRatio)
                .offset(animationProvider.offset)
                .rotationEffect(.init(degrees: animated ? rotation : rotation + 360 ))
                .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                .opacity(0.9)
                .blur(radius: blur)
                .onAppear{
                    animated.toggle()
                }
        }
    }
}

struct Circles: View {

    let blur: CGFloat = 80
    
    @State var animated = false
    
    var body: some View {
        GeometryReader { proxy in
            ZStack{
                
                /// Background color
                Color.backgroundMain
                    .ignoresSafeArea()
                
                /// Blue
                Shapes(
                    alignment: .topTrailing,
                    color: Color.backgroundBlue,
                    duration: 20,
                    proxy: proxy,
                    blur: blur
                    )
                
                /// Pink
                Shapes(
                    alignment: .topLeading,
                    color: Color.backgroundPink,
                    duration: 30,
                    proxy: proxy,
                    blur: blur
                )
                
                /// Green
                Shapes(
                    alignment: .bottomLeading,
                    color: Color.backgroundGreen,
                    duration: 20,
                    proxy: proxy,
                    blur: blur
                )
                
                /// Yellow
                Shapes(
                    alignment: .bottomLeading,
                    color: Color.backgroundYellow,
                    duration: 35,
                    proxy: proxy,
                    blur: blur
                )
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
