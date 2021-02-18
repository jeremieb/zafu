//
//  SettingsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 18/02/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            
            /// Background color
            Color.modalBackground.ignoresSafeArea()
            
            VStack {
                /// Logo
                VStack {
                    Image("logo")
                }.padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 10){
                        
                        // MARK: - ACHIEVEMENT SECTION
                        HeaderSectionView(title: "Achievements")
                        AchievementsSectionView(weeklyAverage: 1.2, monthlyAverage: 2.3)
                        
                        // MARK: - TIMER SETTINGS SECTION
                        HeaderSectionView(title: "Timer")
                        
                        // MARK: - SYSTEM SECTION
                        HeaderSectionView(title: "System")
                        
                        // MARK: - OTHERS SECTION
                        HeaderSectionView(title: "Others")
                        
                        // MARK: - FOOTER
                        FooterView()
                    }
                }
                
            } // end main VStack
        } /// end main ZStack
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
            SettingsView()
                .preferredColorScheme(.dark)
        }
    }
}


