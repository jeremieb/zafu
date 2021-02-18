//
//  SettingsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 18/02/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            
            /// Background color
            Color.modalBackground.ignoresSafeArea()
            
            VStack {
                /// Logo
                VStack {
                    Image("logo")
                }.padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 10){
                        
                        // MARK: - ACHIEVEMENT SECTION
                        HeaderSection(title: "Achievements")
                        
                        // MARK: - TIMER SETTINGS SECTION
                        HeaderSection(title: "Timer")
                        
                        // MARK: - SYSTEM SECTION
                        HeaderSection(title: "System")
                        
                        // MARK: - OTHERS SECTION
                        HeaderSection(title: "Others")
                        
                        // MARK: - FOOTER
                        FooterView()
                    }
                }
                
            } // end main VStack
        } /// end main ZStack
    }
}

struct HeaderSection: View {
    var title: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.mainColor.opacity(0.3)
                HStack {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .foregroundColor(.headersColor)
                        .multilineTextAlignment(.leading)
                        .textCase(.uppercase)
                    Spacer()
                }.padding(.horizontal)
                
            }.frame(minWidth: geo.size.width, minHeight: 20)
        }
    }
}

struct FooterView: View {
    
    private var heart = Image(systemName: "heart.fill")
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Made with \(heart) in Amsterdam")
                .font(.system(size: 12, weight: .semibold, design: .serif))
                .foregroundColor(.mainColor)
            Image("amsterdam")
        }.padding(.vertical)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
            SettingsView()
                .preferredColorScheme(.dark)
        }
    }
}


