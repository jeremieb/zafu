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
                        SettingsHeaderView(title: "Debug")
                        DebugView(motion: MotionProvider())
                        
                        Spacer()
                    }
                }.navigationTitle("Settings")
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
        }
    }
}

struct SettingsHeaderView: View {
    
    var title: String = "Header title"
    
    var body: some View{
        VStack {
            Text(title)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(Color("elementSecondary"))
                .multilineTextAlignment(.leading)
                .textCase(.uppercase)
                .lineLimit(1)
                .padding()
                .frame(width: UIScreen.main.bounds.size.width, height: 22, alignment: .leading)
                .background(Color(UIColor.systemFill))
        }
        .padding(.top, 16)
        .padding(.bottom, 5)
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
