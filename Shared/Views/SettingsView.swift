//
//  SettingsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 14/05/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isPresented: Bool
    
    @AppStorage("soundscapePlay", store: UserDefaults(suiteName: "com.jeremieberduck.zafu")) var soundscapePlay: Bool = true
        
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    /// Background soundscape
                    Group{
                        SectionHeaderView(title: "Soundscape")
                        
                        Text("Select a soundscape of your choice to play along with your meditation and after the session is done.")
                            .font(.footnote)
                            .foregroundColor(Color("elementSecondary"))
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(6)
                            .padding(.horizontal)
                            .padding(.bottom, 20)

                        ScrollView(.horizontal) {
                            HStack(alignment: .top, spacing: 20.0){
                                
                                VStack(alignment: .center) {
                                    CircleSelection(title: "Sound one")
                                }
                                
                                VStack(alignment: .center) {
                                    CircleSelection(title: "Sound two", color: .backgroundGreen)
                                }
                                
                                /// NO SOUND
                                VStack(alignment: .center) {
                                    CircleSelection(title: "No Sound", color: Color(UIColor.systemGray2), image: Image(systemName: "speaker.slash.fill"))
                                        .onTapGesture {
                                            if soundscapePlay {
                                                withAnimation(){
                                                    soundscapePlay = false
                                                }
                                                AudioPlayer.stopBackgroundSound()
                                            } else {
                                                withAnimation(){
                                                    soundscapePlay = true
                                                }
                                                AudioPlayer.playBackgroundSound(soundFile: "birds-in-the-jungle.m4a")
                                            }
                                        }
                                    Circle()
                                        .fill(Color.textPurple)
                                        .frame(width: 5, height: 5)
                                        .opacity(soundscapePlay ? 0 : 1)
                                }
                            }.padding(.horizontal)
                        }

                    }/// end background soundscape
                    
                    
                    Divider().padding(.vertical, 30)
                    
                    /// Footer
                    FooterView().padding(.bottom, 50)
                }
            }
            .navigationTitle("Settings")
            .toolbar(content: {
                Button(action: {
                    isPresented.toggle()
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 22))
                        .frame(width: 44, height: 44)
                }
            })
        }
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

struct FooterView: View {
    
    private let versionNumber: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as AnyObject?
    private let buildNumber: AnyObject? = Bundle.main.infoDictionary!["CFBundleVersion"] as AnyObject?
    
    var body: some View{
        VStack(alignment: .center){
            Text("Zafu v\(versionNumber as! String) (\(buildNumber as! String))")
                .font(.footnote)
                .foregroundColor(.elementSecondary)
                .multilineTextAlignment(.center)
        }.frame(width: UIScreen.main.bounds.size.width)
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
