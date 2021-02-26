//
//  TimerViewModel.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 10/02/2021.
//

import Foundation

final class TimerViewModel: ObservableObject {
    
    /// Timer status
    @Published var isStarted = false
    
    /// Hack force update
    func updateView(){
        self.objectWillChange.send()
    }
    
}
