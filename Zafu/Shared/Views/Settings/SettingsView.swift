//
//  SettingsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 18/02/2021.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                /// Background colour
                Color.modalBackground.ignoresSafeArea()
                
                VStack {
                    
                    /// Logo
                    VStack { Image("logo") }
                        .padding(.vertical)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(alignment: .center, spacing: 10){
                            
                            // MARK: - ACHIEVEMENT SECTION
                            HeaderSectionView(title: "Achievements").frame(height: 20)
                            AchievementsSectionView(weeklyAverage: 1.2, monthlyAverage: 2.3)
                            
                            // MARK: - TIMER SETTINGS SECTION
                            HeaderSectionView(title: "Timer").frame(height: 20)
                            SettingsTimerSelectionView()
                            
                            
                            // MARK: - SYSTEM SECTION
                            HeaderSectionView(title: "System").frame(height: 20)
                            Group{
                                
                                /// Health Kit
                                NavigationLink( destination: SettingsHealthView() ){
                                    SettingsNavigationView(icon: "heart.fill", title: "Health Sync")
                                }
                                
                                Divider()
                                
                                /// Siri Kit
                                NavigationLink( destination: SettingsSiriView() ) {
                                    SettingsNavigationView(icon: "mic.fill", title: "Siri Shortcuts")
                                }
                                
                                Divider()
                                
                                /// Custom App Icon
                                NavigationLink( destination: SettingsAppIconsView() ) {
                                    SettingsNavigationView(icon: "app.badge.fill", title: "Alternate App Icon")
                                }
                            }
                            
                            // MARK: - OTHERS SECTION
                            HeaderSectionView(title: "Others").frame(height: 20)
                            
                            Group {
                                
                                /// About view
                                NavigationLink ( destination: SettingsAboutView() ) {
                                    SettingsNavigationView(icon: "person.fill", title: "About")
                                }
                                
                                Divider()
                                
                                /// Privacy view
                                NavigationLink( destination: SettingsPrivacyView()) {
                                    SettingsNavigationView(icon: "shield.checkerboard", title: "Privacy")
                                }
                                
                                Divider()
                                
                                /// Support view
                                
                            }
                            
                            // MARK: - FOOTER
                            FooterView()
                        }
                    }
                    
                } /// end main VStack
                
            } /// end main ZStack
            
            /// Hiding Navigation View top bar
            .navigationBarTitle("")
            .navigationBarHidden(true)
        } /// end NavigationView
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


