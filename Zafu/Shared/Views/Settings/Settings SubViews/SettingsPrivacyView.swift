//
//  SettingsPrivacyView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsPrivacyView: View {
    var body: some View {
        
        SettingsSubView(title: "Privacy", icon: "shield.checkerboard") {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        }
    }
}

struct SettingsPrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPrivacyView()
    }
}
