//
//  MainView.swift
//  Shared
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI
import CoreMotion

struct MainView: View {
  
    var body: some View {
        ZStack {
            BackgroundView()
            VStack() {
                
                /// View Header
                HeaderMainView()
                
                /// My favorites or My sessions
                Group {
                    SectionHeaderView(title: "My Sessions")
                    SmallSessionCellView()
                }
                
                /// Featured sessions
                Group {
                    SectionHeaderView(title: "Featured")
                    LargeSessionCellView()
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
            MainView()
                .preferredColorScheme(.dark)
        }
    }
}
