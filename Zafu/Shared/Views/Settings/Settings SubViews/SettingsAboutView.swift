//
//  SettingsAboutView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsAboutView: View {
    var body: some View {
        ZStack {
            
            /// Background color
            Color.modalBackground.ignoresSafeArea()
            
            VStack {
                Text("Body")
            }
            
        }.navigationTitle("About")
    }
}

struct SettingsAboutView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAboutView()
    }
}
