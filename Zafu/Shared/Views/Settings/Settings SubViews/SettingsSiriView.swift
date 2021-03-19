//
//  SettingsSiriView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsSiriView: View {

    var body: some View {
        
        SettingsSubView(title: "Siri Shortcuts", icon: "mic.fill") {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        }
    }
}

struct SettingsSiriView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsSiriView()
            SettingsSiriView()
                .preferredColorScheme(.dark)
        }
    }
}
