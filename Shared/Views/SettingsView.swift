//
//  SettingsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 14/05/2021.
//

import SwiftUI

struct SettingsView: View {
    
    public init(isPresented: Binding<Bool>){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.mainPurple)]
        self._isPresented = isPresented
    }
    
    @Binding var isPresented: Bool
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    /// Background soundscape
                    Group {
                        SectionHeaderView(title: "Soundscape").padding(.top,30)
                        SoundSelection()
                    }
                    
                    Divider().padding(.vertical, 20)
                    
                    /// Alert & Bells
                    Group{
                        SectionHeaderView(title: "Alerts")
                        AlertBellsView()
                    }
                    
                    Divider().padding(.vertical, 20)
                    
                    /// Alternat app icons
                    Group {
                        SectionHeaderView(title: "Alternate app icons")
                        AlternateAppIcons()
                    }
                    
                    Divider().padding(.vertical, 30)
                    
                    /// Footer
                    FooterView().padding(.bottom, 50)
                }
            }
            .fixFlickering() /// Fixing the glitch for NavigationView with ScrollView
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
            .background(BackgroundView())
        }
    }
}

// MARK: - Alert & Bells View
struct AlertBellsView: View {
    
    @AppStorage("alertFile", store: UserDefaults(suiteName: "com.jeremieberduck.zafu")) var alertFile: Int = 1
    
    var body: some View {
        Text("Select a sound to be alerted when your the session is done.")
            .font(.footnote)
            .foregroundColor(Color.mainPurple)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(6)
            .padding(.horizontal)
            .padding(.bottom, 20)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20.0){
                
                ForEach(Array(bellFiles.enumerated()), id: \.offset) { index, bell in
                    CircleSelection(selection: $alertFile, title: bell.name, color: bell.color, image: Image(systemName: "bell"), id: bell.id)
                        .onTapGesture {
                            withAnimation{
                                AudioPlayer.stopSecondarySound()
                                alertFile = bell.id
                                AudioPlayer.playSecondarySound(soundFile: bell.file)
                            }
                        }
                }
            }.padding(.horizontal)
        }
    }
}

// MARK: - AlternateAppIcons View
struct AlternateAppIcons: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top, spacing: 20) {
                
                // Default
                VStack(alignment: .center) {
                    Image("default")
                        .scaledToFill()
                        .frame(width: 52, height: 52)
                    Text("Default")
                        .font(.footnote)
                        .foregroundColor(.mainPurple)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                }.onTapGesture {
                    UIApplication.shared.setAlternateIconName(nil)
                }.frame(width: 80)
                
                // Default Black
                AppIconItem(title: "Black", image: "default-black")
                
                // Pride
                AppIconItem(title: "Pride", image: "pride")
                
                // Trans
                AppIconItem(title: "Trans Pride", image: "pride-trans")
                
            }.padding(.horizontal).padding(.top, 20)
        }
    }
}

// MARK: - AppIconItem View
struct AppIconItem: View {
    
    var title: String
    var image: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(image)
                .scaledToFill()
                .frame(width: 52, height: 52)
            Text(title)
                .font(.footnote)
                .foregroundColor(.mainPurple)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
        }.onTapGesture {
            UIApplication.shared.setAlternateIconName(image)
        }.frame(width: 80)
    }
}

// MARK: - Sound Selection View
struct SoundSelection: View {
    
    @AppStorage("soundscapeFile", store: UserDefaults(suiteName: "com.jeremieberduck.zafu")) var soundscapeFile: Int = 1
    
    var body: some View {
        Text("Select a soundscape of your choice to play along with your meditation and after the session is done.")
            .font(.footnote)
            .foregroundColor(Color.mainPurple)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(6)
            .padding(.horizontal)
            .padding(.bottom, 20)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20.0){
                
                ForEach(Array(soundFiles.enumerated()), id: \.offset) { index, sound in
                    CircleSelection(selection: $soundscapeFile, title: sound.name, color: sound.color, image: Image(systemName: sound.image ?? "tortoise.fill"), id: sound.id)
                        .onTapGesture {
                            withAnimation{
                                if sound.id == 0 {
                                    withAnimation() {
                                        soundscapeFile = sound.id
                                    }
                                    AudioPlayer.stopBackgroundSound()
                                } else {
                                    withAnimation() {
                                        soundscapeFile = sound.id
                                    }
                                    AudioPlayer.playBackgroundSound(soundFile: sound.file)
                                }
                            }
                        }
                }
            }.padding(.horizontal)
        }
    }
}


// MARK: - CircleSelection View
struct CircleSelection: View {
    
    @Binding var selection: Int
    @State private var selected: Bool = false
    
    var title: String = "Button title"
    var color: Color
    var image: Image?
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
                    .foregroundColor(.mainPurple)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                
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
        }.frame(width: 80)
    }
}

// MARK: - Footer View

struct FooterView: View {
    
    private let versionNumber: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as AnyObject?
    private let buildNumber: AnyObject? = Bundle.main.infoDictionary!["CFBundleVersion"] as AnyObject?
    
    var body: some View{
        VStack(alignment: .center){
            Text("Zafu v\(versionNumber as! String) (\(buildNumber as! String))")
                .font(.footnote)
                .foregroundColor(.mainPurple)
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
