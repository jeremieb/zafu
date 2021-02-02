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
            
        }
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
