//
//  SettingsSubView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 19/03/2021.
//

import SwiftUI

struct SettingsSubView <Content : View> : View {
    
    let content: Content /// Can be anything
    let title: String /// Set the title of the main view
    let icon: String /// Set the icon on the background

    init(title: String, icon: String, @ViewBuilder contentBuilder: () -> Content){
        self.content = contentBuilder()
        self.title = title
        self.icon = icon
    }

    var body: some View {
        
        ZStack {
            
            /// Header
            SettingsSubViewHeader(icon: icon)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    /// Title
                    Text(title)
                        .font(.system(size: 42, weight: .heavy, design: .serif))
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    /// Content
                    content

                }
                .padding()
                .font(.system(size: 17, weight: .semibold, design: .serif))
                .foregroundColor(.mainColor)
                
            }.frame(width: UIScreen.main.bounds.width)
            
        }
        // end ZStack
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(false)
    }
}

struct SettingsSubViewHeader: View {

    var icon: String = "seal.fill"
    
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
            }.padding()
        }
    }
}

struct SettingsSubView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSubView(title: "My Title", icon: "seal.fill") {
            Text("Test")
        }
    }
}
