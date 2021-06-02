//
//  TimerData.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 24/05/2021.
//
// ⚠️ https://kavsoft.dev/SwiftUI_2.0/Timer/

import SwiftUI

class TimerData: ObservableObject {
    
    /// Timer value
    @Published var time: Int = 0 * 60
    @Published var selectedTime: Int = 0 * 60
    
    /// Used this to know if the sessions has started, like for animations
    @Published var sessionHasStarted = false
    
    /// Pickup how much time remains if going to the background
    @Published var leftTime: Date!
    
    /// Reset the session view if the session has ended or if it's manually stoped
    func stopSession() {
        withAnimation(.default){
            time = 0
            selectedTime = 0
            sessionHasStarted = false
            leftTime = nil
        }
    }
}
