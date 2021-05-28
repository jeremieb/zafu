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
    @AppStorage("soundscapeFile", store: UserDefaults(suiteName: "com.jeremieberduck.zafu")) var soundscapeFile: Int = 1
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    /// Background soundscape
                    Group {
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
                                
                                ForEach(Array(soundFiles.enumerated()), id: \.offset) { index, sound in
                                    CircleSelection(selection: $soundscapeFile, title: sound.name, color: Color(sound.color), image: Image(systemName: sound.image ?? "tortoise.fill"), id: sound.id)
                                        .onTapGesture {
                                            withAnimation{
                                                if soundscapePlay && sound.id == 0 {
                                                    withAnimation() {
                                                        soundscapeFile = sound.id
                                                        soundscapePlay = false
                                                    }
                                                    AudioPlayer.stopBackgroundSound()
                                                } else {
                                                    withAnimation() {
                                                        soundscapeFile = sound.id
                                                        soundscapePlay = true
                                                    }
                                                    AudioPlayer.playBackgroundSound(soundFile: sound.file)
                                                }
                                            }
                                        }
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
    
    @Binding var selection: Int
    @State var selected: Bool = false
    
    var title: String = "Button title"
    var color: Color = Color(UIColor.systemPink)
    var image: Image = Image(systemName: "tortoise.fill")
    var id: Int
    
    var body: some View{
        VStack(alignment: .center) {
            VStack(alignment: .center){
                color
                    .frame(width: 52, height: 52)
                    .clipShape(Circle())
                    .overlay(image)
                    .foregroundColor(Color(UIColor.systemBackground))
                Text(title)
                    .font(.footnote)
            }
            if selection == id {
                Circle()
                    .fill(Color.textPurple)
                    .frame(width: 5, height: 5)
                    .opacity(1)
            } else {
                Circle()
                    .fill(Color.textPurple)
                    .frame(width: 5, height: 5)
                    .opacity(0)
            }
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
