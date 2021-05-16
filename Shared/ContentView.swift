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
            VStack() {
                
                /// View Header
                HeaderMainView()
                
                /// My favorites or My sessions
                Group {
                    SectionHeaderView(title: "My Sessions")
                    ListSessionCustomView()
                }
                
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
