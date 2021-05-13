//
//  SettingsNavigationView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 22/02/2021.
//

import SwiftUI

struct SettingsNavigationView: View {
    
    var icon: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading){
            
            Spacer().frame(height: 16)
            
            /// The Row
            HStack(alignment: .center) {
                
                /// The icon
                ZStack{
                    Circle()
                        .fill(Color.mainColor)
                        .frame(width: 50, height: 50, alignment: .leading)
                        .opacity(0.15)
                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .medium))
                }
                
                Spacer().frame(width: 16)
                
                /// Title
                Text(title)
                    .font(.system(size: 17, weight: .semibold, design: .serif))
                
                Spacer()
                
                /// Chevron
                Image(systemName: "chevron.forward").opacity(0.3)
            }
            
            Spacer().frame(height: 16)
        }
        .frame(minHeight: 50, alignment: .leading)
        .foregroundColor(.mainColor)
        .padding(.horizontal)
    }
}

struct SettingsNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsNavigationView(icon: "timer", title: "25 minutes")
    }
}
