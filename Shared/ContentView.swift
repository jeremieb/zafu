//
//  ContentView.swift
//  Shared
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    @State var debugSheet = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 20.0) {
                Text("Hello world")
                    .padding()
                Button(action: { self.debugSheet = true }) {
                    Text("Show Debug")
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 44)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.accentColor)
                        )
                }
            }.sheet(isPresented: $debugSheet) {
                DebugView(isPresented: $debugSheet)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
