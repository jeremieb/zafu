//
//  MotionProvider.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI
import CoreMotion

final class MotionProvider: ObservableObject {
    
    @Published var x = Double.zero
    @Published var y = Double.zero
    @Published var z = Double.zero
    
    private var motionManager = CMMotionManager()
    
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.accelerometerUpdateInterval = 0.5
        self.motionManager.startDeviceMotionUpdates(to: .main) { (data: CMDeviceMotion?, error: Error?) in
            //            self.motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
            guard let data = data else {
                print("Error: \(error!)")
                return
            }
            
            let attitude: CMRotationRate = data.rotationRate
            
            DispatchQueue.main.async {
                self.x = attitude.x
                self.y = attitude.y
                self.z = attitude.z
            }
        }
    }
}
