//
//  MotionProvider.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI
import CoreMotion

final class MotionProvider: ObservableObject {
    
    @Published var pitch = Double.zero
    @Published var yaw = Double.zero
    @Published var roll = Double.zero
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    init(){
        self.motionManager.startDeviceMotionUpdates(to: self.queue) { (data: CMDeviceMotion?, error: Error?) in
            guard let data = data else {
                print("Error: \(error!)")
                return
            }
            let attitude: CMAttitude = data.attitude
            
            DispatchQueue.main.async {
                self.pitch = attitude.pitch
                self.yaw = attitude.yaw
                self.roll = attitude.roll
            }
        }
    }
}
