//
//  SettingsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 14/05/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isPresented: Bool
    @State var isPlaying: Bool = true
    
    public init(isPresented: Binding<Bool>){
        UINavigationBar.appearance().barTintColor = UIColor(Color.clear)
        self._isPresented = isPresented
    }
    
    var body: some View {
        
        
        return VStack {
            ScrollView{
                VStack {
                    ZStack {
                        HeaderMainView(title: "Settings")
                        HStack {
                            Spacer()
                            Button(action: {
                                isPresented.toggle()
                            }) {
                                Image(systemName: "xmark.circle")
                                    .font(.system(size: 22))
                                    .foregroundColor(Color(UIColor.systemGray))
                                    .frame(width: 44, height: 44)
                            }
                        }.padding(.horizontal)
                    }
                    
                    Button(action: {
                        if isPlaying {
                            AudioPlayer.stopMainSound()
                            isPlaying.toggle()
                        } else {
                            AudioPlayer.playMainSound(soundFile: "birds-in-the-jungle.m4a")
                            isPlaying.toggle()
                        }
                    }) {
                        if isPlaying {
                            Label("Stop sound", systemImage: "speaker.slash.fill")
                        } else {
                            Label("Start sound", systemImage: "speaker.fill")
                        }
                    }
                    
                    
                    Spacer()
                }
            }.navigationBarTitle(Text("Settings"), displayMode: .large)
            .background(Color.clear)
        }.background(BackgroundView().opacity(0.4))
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var showingSheet = false
    
    static var previews: some View {
        Group {
            SettingsView(isPresented: $showingSheet)
            SettingsView(isPresented: $showingSheet)
                .preferredColorScheme(.dark)
        }
    }
}
