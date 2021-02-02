//
//  BackgroundView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 02/02/2021.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {

            LinearGradient(gradient: gradientBackground, startPoint: .bottomTrailing, endPoint: .topLeading).ignoresSafeArea()
            
            BottomShapeBack()
        }
    }
}

struct BottomShapeBack: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: geometry.size.height / 1.6 ))
                path.addCurve(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2.6),
                              control1: CGPoint(x: geometry.size.width / 3, y: geometry.size.height / 3.4),
                              control2: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 1.6))
                path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 8))
                path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
            }.fill(Color("shapes"))
            
        }.ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BackgroundView()
            BackgroundView()
                .preferredColorScheme(.dark)
        }
    }
}
