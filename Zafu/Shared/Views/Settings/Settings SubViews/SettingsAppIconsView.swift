//
//  SettingsAppIconsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsAppIconsView: View {
    var body: some View {

        SettingsSubView(title: "Alternate App Icons", icon: "app.badge.fill")
        
    }
}

struct SettingsAppIconsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAppIconsView()
    }
}
