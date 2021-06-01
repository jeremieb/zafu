//
//  HeaderMainView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI

struct HeaderMainView: View {
    
    /// Opening modal view
    @State var settingsSheet = false
    
    /// Only for the main view
    var isHome: Bool = false
    var title: String = "Welcome"
    var username: String = "Human"
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
                if isHome {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.regular)
                    Text(username)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                } else {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }.foregroundColor(.mainPurple)
            Spacer()
            if isHome {
                Button(action: {
                    self.settingsSheet = true
                }) {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                        .foregroundColor(.mainPurple)
                }.padding(.top, 5)
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 20)
        .padding(.horizontal)
        .sheet(isPresented: $settingsSheet) {
            SettingsView(isPresented: $settingsSheet)
        }
    }
}

struct HeaderMainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderMainView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
            HeaderMainView()
                .preferredColorScheme(.dark)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
        }
    }
}
