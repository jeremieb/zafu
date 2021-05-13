//
//  ZafuApp.swift
//  Shared
//
//  Created by Jeremie Berduck on 08/01/2021.
//

import SwiftUI

@main
struct ZafuApp: App {
    
    init() {
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    private var myTimer = TimerViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(myTimer)
        }
    }
}
