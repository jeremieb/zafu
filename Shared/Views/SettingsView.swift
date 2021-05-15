//
//  SettingsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 14/05/2021.
//

import SwiftUI

struct SettingsView: View {

    @Binding var isPresented: Bool

    var body: some View {
        
        NavigationView{
            ZStack {
                
                BackgroundDefaultView()
                
                ScrollView{
                    VStack(alignment: .leading){
                        
                        /// DEBUG
                        
                        /// Accelerometer
                        SectionHeaderView(title: "Debug")
                        DebugView(motion: MotionProvider())
                        
                        Spacer()
                    }
                }.navigationBarTitle(Text("Settings"), displayMode: .large)
                
                .toolbar(content: {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 44))
                            .frame(width: 44, height: 44)
                    }
                })
            }
        }.navigationBarColor(backgroundColor: UIColor(Color("backgroundMain")), tintColor: .label)
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var showingSheet = false
    
    static var previews: some View {
        Group {
            SettingsView(isPresented: $showingSheet)
            SettingsView(isPresented: $showingSheet)
                .preferredColorScheme(.dark)
        }
    }
}
