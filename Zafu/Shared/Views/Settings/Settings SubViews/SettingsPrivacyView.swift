//
//  SettingsPrivacyView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsPrivacyView: View {
    var body: some View {
        
        SettingsSubView(title: "Privacy", icon: "shield.checkerboard")
    }
}

struct SettingsPrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPrivacyView()
    }
}
