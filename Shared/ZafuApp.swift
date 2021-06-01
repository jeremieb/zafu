//
//  ZafuApp.swift
//  Shared
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI

@main
struct ZafuApp: App {

    @StateObject var data = TimerData()
    @StateObject var dataController = DataController()
    
    @Environment(\.scenePhase) var scene
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(data)
                .environmentObject(dataController)
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
