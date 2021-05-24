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
        
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    /// Header stack
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
                    
                    /// Background soundscape
                    Group{
                        SectionHeaderView(title: "Soundscape")
                        
                        Text("Select a soundscape of your choice to play along with your meditation and after the session is done")
                            .font(.footnote)
                            .foregroundColor(Color("elementSecondary"))
                            .lineLimit(5)
                            .padding(.horizontal)
                            .padding(.bottom, 20)

                        ScrollView(.horizontal) {
                            HStack(spacing: 20.0){
                                CircleSelection(title: "Sound one")
                                CircleSelection(title: "Sound two", color: .backgroundGreen)
                            }.padding(.horizontal)
                        }

                    }
                    
                    Divider()
                        .padding(.vertical, 30)
                    
                    Button(action: {
                        if isPlaying {
                            AudioPlayer.stopBackgroundSound()
                            isPlaying.toggle()
                        } else {
                            AudioPlayer.playBackgroundSound(soundFile: "birds-in-the-jungle.m4a")
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
            }.background(Color.clear)
        }.background(BackgroundView().opacity(0.4))
    }
}

struct CircleSelection: View {
    
    var title: String = "Button title"
    var color: Color = Color(UIColor.systemPink)
    var image: Image = Image(systemName: "tortoise.fill")
    
    var body: some View{
        VStack(alignment: .center){
            color
                .frame(width: 52, height: 52)
                .clipShape(Circle())
                .overlay(image)
                .foregroundColor(Color(UIColor.systemBackground))
            Text(title)
                .font(.footnote)
        }
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
