//
//  SettingsHealthView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsHealthView: View {

    var body: some View {
        
        SettingsSubView(title: "Health Sync", icon: "heart.fill")
        
    }
}

struct SettingsHealthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingsHealthView()
        }
    }
}
