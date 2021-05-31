//
//  ZafuApp.swift
//  Shared
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI

@main
struct ZafuApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @StateObject var data = TimerData()
    
    @Environment(\.scenePhase) var scene
    
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(data).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scene) { (newScene) in
            #if !targetEnvironment(simulator)
            
            if newScene == .background {
                data.leftTime = Date()
                print("Enter background")
            }
            
            if newScene == .active && data.leftTime != nil {
                let diff = Date().timeIntervalSince(data.leftTime)
                let currentTime = data.selectedTime - Int(diff)
                print(currentTime)
                if currentTime >= 0 {
                    withAnimation(.default) {
                        data.selectedTime = currentTime
                    }
                } else {
                    data.stopSession()
                }
            }
            
            #endif
        }
    }
}
