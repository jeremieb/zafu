//
//  SettingsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 18/02/2021.
//

import SwiftUI

struct SettingsView: View {
    
    /// View Models
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                /// Background color
                Color.modalBackground.ignoresSafeArea()
                
                VStack {
                    
                    /// Logo
                    VStack { Image("logo") }.padding(.vertical)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(alignment: .center, spacing: 10){
                            
                            // MARK: - ACHIEVEMENT SECTION
                            HeaderSectionView(title: "Achievements").frame(height: 20)
                            AchievementsSectionView(weeklyAverage: 1.2, monthlyAverage: 2.3)
                            
                            // MARK: - TIMER SETTINGS SECTION
                            HeaderSectionView(title: "Timer").frame(height: 20)
                            Group {
                                
                                /// First timer settings
                                NavigationLink(destination: SettingsTimerView()){
                                    SettingsNavigationView(icon: "timer", title: "15 minutes")
                                }
                                
                                Divider()
                                
                                /// Second timer settings
                                NavigationLink(destination: SettingsTimerView()){
                                    SettingsNavigationView(icon: "timer", title: "20 minutes")
                                }
                            }
                            
                            
                            // MARK: - SYSTEM SECTION
                            HeaderSectionView(title: "System").frame(height: 20)
                            Group{
                                
                                /// Health Kit
                                NavigationLink( destination: EmptyView() ){
                                    SettingsNavigationView(icon: "heart.fill", title: "Health Sync")
                                }
                                
                                Divider()
                                
                                /// Siri Kit
                                NavigationLink( destination: EmptyView() ) {
                                    SettingsNavigationView(icon: "mic.fill", title: "Siri Shortcuts")
                                }
                                
                                Divider()
                                
                                /// Custom App Icon
                                NavigationLink( destination: EmptyView() ) {
                                    SettingsNavigationView(icon: "app.badge.fill", title: "Alternate App Icon")
                                }
                            }
                            
                            // MARK: - OTHERS SECTION
                            HeaderSectionView(title: "Others").frame(height: 20)
                            
                            Group {
                                
                                /// About view
                                NavigationLink ( destination: EmptyView() ) {
                                    SettingsNavigationView(icon: "person.fill", title: "About")
                                }
                                
                                Divider()
                                
                                /// Privacy view
                                NavigationLink( destination: EmptyView()) {
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
            
            /// Hidding Navigation View top bar
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


