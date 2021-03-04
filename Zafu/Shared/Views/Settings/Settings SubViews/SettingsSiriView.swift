//
//  SettingsSiriView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsSiriView: View {

    var body: some View {
        
        SettingsSubView(title: "Siri Shortcuts", icon: "mic.fill")
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
