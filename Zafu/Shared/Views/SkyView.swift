//
//  SkyView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 10/02/2021.
//

import SwiftUI

struct SkyView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var screenSize: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// Animation State
    @State var animated = false

    /// Sun Moving
    private let sunHorizontalMoving: CGFloat = UIScreen.main.bounds.width - 120
    private let sunVerticalMoving: CGFloat = 0
    
    /// Cloud ONE Animation
    private let cloudOne: CGFloat = UIScreen.main.bounds.width
    
    /// Cloud TWO Animation
    private let cloudTwo: CGFloat = -UIScreen.main.bounds.width
    
    var body: some View {
        
        GeometryReader { geometry in
            
            /// Sky animation
            VStack {
                
                if colorScheme == .light {
                    /// Light mode
                    ZStack{
                        /// CLOUDS
                        Image(systemName: "cloud.fill") /// CLOUD ONE
                            .font(.system(size: 85, weight: .regular))
                            .foregroundColor(.shapesColor)
                            .offset(x: animated ? cloudOne : -520, y: -80)
                            .animation(.linear(duration: 20).repeatForever(autoreverses: true))
                        
                        Image(systemName: "cloud.fill") /// CLOUD TWO
                            .font(.system(size: 85, weight: .regular))
                            .foregroundColor(.shapesColor)
                            .offset(x: animated ? cloudTwo : screenSize - 100)
                            .animation(.linear(duration: 15).repeatForever(autoreverses: true))
                        
                        /// SUN
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 120, weight: .regular))
                            .foregroundColor(.shapesColor)
                            .offset( x: animated ? sunHorizontalMoving : -120, y: animated ? sunVerticalMoving : 100)
                            .animation(.linear(duration: 30).repeatForever(autoreverses: true))
                            .onAppear( perform: {
                                animated.toggle()
                            })
                    }
                    
                } else {
                    
                    /// Dark mode
                    ZStack{
                        /// STARS
                        Circle()
                            .fill(Color.mainColor)
                            .frame(width: 5, height: 5)
                            .shadow(color: .mainColor, radius: 5.0, x: 0, y: 0)
                        
                        Circle()
                            .fill(Color.mainColor)
                            .frame(width: 5, height: 5)
                            .shadow(color: .mainColor, radius: 5.0, x: 0, y: 0)
                            .offset(x: -90.0, y: -80.0)
                        
                        Circle()
                            .fill(Color.mainColor)
                            .frame(width: 5, height: 5)
                            .shadow(color: .mainColor, radius: 5.0, x: 0, y: 0)
                            .offset(x: -50.0, y: -120.0)
                        
                        Circle()
                            .fill(Color.mainColor)
                            .frame(width: 5, height: 5)
                            .shadow(color: .mainColor, radius: 5.0, x: 0, y: 0)
                            .offset(x: 100.0, y: 50.0)
                        
                        /// SUN
                        Image(systemName: "moon.stars.fill")
                            .font(.system(size: 120, weight: .regular))
                            .foregroundColor(.mainColor)
                            .offset( x: -120, y: 100)
                            .shadow(color: .mainColor, radius: 18.0, x: 0, y: 0)
                    }
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .ignoresSafeArea()
        }
    }
}

struct SkyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                BackgroundView()
                VStack {
                    SkyView()
                    Spacer().frame(height: UIScreen.main.bounds.height / 2)
                }
            }
            ZStack {
                BackgroundView()
                VStack {
                    SkyView()
                    Spacer().frame(height: UIScreen.main.bounds.height / 2)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}
