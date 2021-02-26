//
//  SettingsSiriView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 26/02/2021.
//

import SwiftUI

struct SettingsSiriView: View {

    var body: some View {
        
        ZStack {
            
            /// Background color
            Color.modalBackground.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                /// Title
                Text("Siri Shortcuts")
                    .font(.system(size: 42, weight: .semibold, design: .serif))
                Text("Body")
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width)
            .foregroundColor(.mainColor)
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
