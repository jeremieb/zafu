//
//  RootView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var data = TimerData()
    @ObservedObject var observer = Observer()
        
    init() {
        UITabBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {

        ZStack {

            TabView(){
                MainView()
                    .tabItem {
                        Image("zafu.logo.fill")
                            .font(.system(size: 22))
                        Text("Today")
                    }.background(BackgroundView()).environmentObject(data)
                MeditationView()
                    .tabItem {
                        Image("zafu_seal")
                            .font(.system(size: 22))
                        Text("Meditation")
                    }.background(BackgroundView())
                SessionsView()
                    .tabItem {
                        Image("zafu_heart")
                            .font(.system(size: 20))
                        Text("Sessions")
                    }.background(BackgroundView())
                
            }
            .tabViewStyle(DefaultTabViewStyle())
            .background(Color.clear)
            
            /// Replacing on appear
            .onReceive(self.observer.$enteredForeground) { _ in
                AudioPlayer.playBackgroundSound(soundFile: "birds-in-the-jungle.m4a")
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
