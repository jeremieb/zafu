//
//  SettingsButtonView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 18/02/2021.
//

import SwiftUI

struct SettingsButtonView: View {
    
    /// Display the settings view
    @State var showSettingsView = false
    
    /// View Model
    @EnvironmentObject var myTimer: TimerViewModel
    
    /// Haptic feedback
    let impact = UIImpactFeedbackGenerator()
    
    var body: some View {
        
        if myTimer.isStarted {
            EmptyView()
        } else {
            VStack {
                HStack {
                    Spacer()
                    Button(action:{
                        self.showSettingsView.toggle()
                        self.impact.impactOccurred()
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.shapesColor)
                    }.frame(width: 44, height: 44).sheet(isPresented: self.$showSettingsView) {
                        SettingsView().environmentObject(myTimer)
                    }
                }.padding(.trailing, 24)
                Spacer()
            }
        }
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView()
    }
}
