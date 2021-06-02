//
//  MainView.swift
//  Shared
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                /// View Header
                HeaderMainView(isHome: true, username: "Jeremie")
                
                /// Stats
                StatsMainView()
                
                /// My favorites or My sessions
                MySessionsView()
                
                /// Featured sessions
                Group {
                    SectionHeaderView(title: "Featured").padding(.top, 30).foregroundColor(.elementSecondary)
                    LargeSessionCellView()
                }
                
                Spacer()
            }.padding(.bottom, 30)
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
