//
//  ContentView.swift
//  Shared
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
  
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 20.0) {
                HeaderMainView()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
