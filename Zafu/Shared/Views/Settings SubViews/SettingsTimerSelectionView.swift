//
//  SettingsTimerSelectionView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 24/02/2021.
//

import SwiftUI

struct SettingsTimerSelectionView: View {
    var body: some View {
        
        
        
        VStack(alignment: .center) {
            
            HStack {
                
                /// First Button
                Button(action: {
                    return
                }) {
                    ButtonTimerSelection()
                }
                
                Spacer()
                
                /// Second Button
                Button(action: {
                    return
                }) {
                    ButtonTimerSelection()
                }
                
            }
            
            Text("Tap the buttons above to set your meditation time.")
                .font(.footnote)
                .foregroundColor(.mainColor)
                .opacity(0.6)
            
        }.padding(.horizontal)
        Spacer().frame(height: 16)
    }
}

struct ButtonTimerSelection: View {
    
    var label: String = "tap to select"
    
    var body: some View {
        
        ZStack {
            
            /// Background color
            Color.mainColor
                .opacity(0.15)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 10.0) {
                Image(systemName: "timer")
                    .font(.system(size: 24))
                Text(label)
                    .font(.system(size: 17, weight: .semibold, design: .serif))
            }
            .padding()
            .foregroundColor(.mainColor)
            
        }
        .frame(width: UIScreen.main.bounds.width / 2.3)
        
    }
}

struct SettingsTimerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTimerSelectionView()
    }
}
