//
//  SettingsHealthView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsHealthView: View {
    var body: some View {
        
        ZStack {
            
            /// Background color
            Color.modalBackground.ignoresSafeArea()
            
            VStack {
                Text("Body")
            }
            
        }.navigationTitle("Health Sync")
    }
}

struct SettingsHealthView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsHealthView()
    }
}
