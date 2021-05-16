//
//  RootView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct RootView: View {
    
    var body: some View {
        
        TabView{
            MainView()
                .tabItem {
//                    Label("Today", image:"zafu.logo.fill")
                    VStack{
                        Image("zafu.logo.fill")
                        Text("Today")
                    }
                }
            MeditationView()
                .tabItem {
                    Label("Meditation", systemImage: "seal.fill")
                }
            SessionsView()
                .tabItem {
                    Label("Sessions", systemImage: "suit.heart.fill")
                }
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
