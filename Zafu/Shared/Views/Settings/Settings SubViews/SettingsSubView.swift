//
//  SettingsSubView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 04/03/2021.
//

import SwiftUI

struct SettingsSubView: View {

    var title: String = "Title placeholder"
    var icon: String = "seal.fill"
    var content: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nUt enim ad minim veniam, quis nostrud exercitation *ullamco* laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. **Excepteur sint** occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
    var body: some View {
        
        ZStack {
            
            /// Background colours
            Color.modalBackground.ignoresSafeArea()
            
            /// Icon
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: icon)
                        .font(.system(size: 90))
                        .foregroundColor(.secondaryColor)
                        .opacity(0.3)
                }
                Spacer()
            }
            .padding()
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    /// Title
                    Text(title)
                        .font(.system(size: 42, weight: .semibold, design: .serif))
                        .fontWeight(.heavy)
                    
                    /// Content
                    Text(content)
                    
                        
                    Spacer()
                }
                .padding()
                .font(.system(size: 17, weight: .semibold, design: .serif))
                .foregroundColor(.mainColor)
                
            }.frame(width: UIScreen.main.bounds.width)
            .foregroundColor(.mainColor)
            
        } // end ZStack
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(false)
    }
}

struct SettingsSubView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingsSubView()
        }
    }
}
