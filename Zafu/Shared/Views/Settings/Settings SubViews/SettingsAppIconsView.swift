//
//  SettingsAppIconsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsAppIconsView: View {
    var body: some View {
        ZStack {
            
            /// Background color
            Color.modalBackground.ignoresSafeArea()
            
            VStack {
                Text("Body")
            }
            
        }.navigationTitle("Alternate App Icons")
    }
}

struct SettingsAppIconsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAppIconsView()
    }
}
