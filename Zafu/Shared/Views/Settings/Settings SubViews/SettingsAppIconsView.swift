//
//  SettingsAppIconsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsAppIconsView: View {
    
    var body: some View {

        ZStack {
            
            // Header
            SettingsSubViewHeader(icon: "app.badge.fill")
            
            // LIST
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    /// Title
                    Text("Alternate App Icons")
                        .font(.system(size: 42, weight: .semibold, design: .serif))
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                    
                    Spacer().frame(height: 30)
                    
                    AppIconsButtonViewDefault(title: "Default")
                    AppIconsButtonView(image: "dark-mode", key: "Dark-Mode", title: "Dark Mode")
                    AppIconsButtonView(image: "proud", key: "Proud", title: "Proud")
                    AppIconsButtonView(image: "proud-second", key: "Proud-Secondary", title: "So Proud")
                    AppIconsButtonView(image: "pure-black", key: "Full-Black", title: "Pure Black")
                    AppIconsButtonView(image: "pure-black-white", key: "Full-Black-White", title: "Pure Black & White")
                }
                .foregroundColor(.mainColor)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(false)
    }
}

/// Generic list item to select an app-icon
struct AppIconsButtonViewDefault: View {
    
    var title: String  /// title name used
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Divider()
            Spacer().frame(height: 12)
            Button(action: {
                UIApplication.shared.setAlternateIconName(nil)
            }) {
                HStack {
                    Image("default").cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                    Spacer().frame(width: 16)
                    Text(title)
                    Spacer()
                }
            }
            Divider()
        }.padding(.horizontal)
    }
}

/// Generic list item to select an app-icon
struct AppIconsButtonView: View {
    
    var image: String  /// file
    var key: String    /// info.plist key string
    var title: String  /// title name used
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Spacer().frame(height: 12)
            Button(action: {
                UIApplication.shared.setAlternateIconName(key)
            }) {
                HStack {
                    Image(image).cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                    Spacer().frame(width: 16)
                    Text(title)
                    Spacer()
                }
            }
            Divider()
        }.padding(.horizontal)
    }
}

struct SettingsAppIconsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAppIconsView()
    }
}
