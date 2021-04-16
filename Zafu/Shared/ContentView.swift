//
//  ContentView.swift
//  Shared
//
//  Created by Jeremie Berduck on 08/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var myTimer: TimerViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            QuotesView()
            TimerView().environmentObject(myTimer)
            SettingsButtonView()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(TimerViewModel())
            ContentView()
                .environmentObject(TimerViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
