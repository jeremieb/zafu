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
    
    /// Displays the username with a placeholder
    var username: String = "Username"
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                Text(username)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            Spacer()
            Button(action: {
                self.settingsSheet = true
            }) {
                Image(systemName: "person.crop.circle")
                    .font(.largeTitle)
                    .foregroundColor(.elementSecondary)
            }
        }
        .padding(.vertical, 20)
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
