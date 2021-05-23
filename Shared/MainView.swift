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
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                /// View Header
                HeaderMainView(isHome: true, username: "Jeremie")
                
                /// Quotes
                QuoteView()
                
                /// Stats
                Group{
                    SectionHeaderView(title: "Stats")
                    StatsMainView()
                }
                
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
            ZStack {
                BackgroundView()
                MainView()
            }
            ZStack {
                BackgroundView()
                MainView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
