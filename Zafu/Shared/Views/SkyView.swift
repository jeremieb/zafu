//
//  SkyView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 10/02/2021.
//

import SwiftUI

struct SkyView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        GeometryReader { geometry in
            
            /// Sky animation
            VStack {
                
                if colorScheme == .light {
                    /// Light mode
                    ZStack{
                        /// CLOUDS
                        Image(systemName: "cloud.fill")
                            .font(.system(size: 85, weight: .regular))
                            .foregroundColor(.shapesColor)
                            .offset(x: -100, y: -80)
                        
                        Image(systemName: "cloud.fill")
                            .font(.system(size: 85, weight: .regular))
                            .foregroundColor(.shapesColor)
                            .offset(x: 80)
                        
                        /// SUN
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 120, weight: .regular))
                            .foregroundColor(.shapesColor)
                            .offset( x: -120, y: 100)
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
        SkyView()
    }
}
