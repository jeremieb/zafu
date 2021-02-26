//
//  SettingsPrivacyView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsPrivacyView: View {
    var body: some View {
        ZStack {
            
            /// Background color
            Color.modalBackground.ignoresSafeArea()
            
            VStack {
                Text("Body")
            }
            
        }.navigationTitle("Privacy")
    }
}

struct SettingsPrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPrivacyView()
    }
}
