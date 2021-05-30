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
    
    @AppStorage("soundscapeFile", store: UserDefaults(suiteName: "com.jeremieberduck.zafu")) var soundscapeFile: Int = 1
        
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
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
                        Image("zafu.seal.fill")
                            .font(.system(size: 22))
                        Text("Meditation")
                    }
                SessionsView()
                    .tabItem {
                        Image("zafu.heart.fill")
                            .font(.system(size: 20))
                        Text("Sessions")
                    }
            }
            .background(Color.clear)
            
            /// Replacing on appear
            .onReceive(self.observer.$enteredForeground) { _ in
                if soundscapeFile == 1 {
                    AudioPlayer.playBackgroundSound(soundFile: "birds-in-the-jungle.m4a")
                } else if soundscapeFile == 2 {
                    AudioPlayer.playBackgroundSound(soundFile: "birds-chirping-near-the-river.m4a")
                }
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
