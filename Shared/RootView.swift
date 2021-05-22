//
//  RootView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct RootView: View {
    
    private enum Tab: Hashable {
        case today
        case meditation
        case sessions
    }
    
    @State private var selectedTab: Tab = .today
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        
        ZStack {

            TabView(selection: $selectedTab){
                MainView()
                    .tag(0)
                    .tabItem {
                        Image("zafu.logo.fill")
                            .font(.system(size: 22))
                        Text("Today")
                    }
                MeditationView()
                    .tag(1)
                    .tabItem {
                        Image("zafu_seal")
                            .font(.system(size: 22))
                        Text("Meditation")
                    }
                SessionsView()
                    .tag(2)
                    .tabItem {
                        Image("zafu_heart")
                            .font(.system(size: 20))
                        Text("Sessions")
                    }
                
            }
            .tabViewStyle(DefaultTabViewStyle())
            .background(Color.clear)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RootView()
            RootView()
                .preferredColorScheme(.dark)
        }
    }
}
