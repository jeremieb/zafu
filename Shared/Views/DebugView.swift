//
//  DebugView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI
import CoreMotion

struct DebugView: View {
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    @State private var pitch = Double.zero
    @State private var yaw = Double.zero
    @State private var roll = Double.zero
    
    @Binding var isPresented: Bool
    
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Button(action: { isPresented = false }, label: {
                    Text("Close")
                })
            }.padding(.horizontal)
            List{
                Text("Pitch: \(String(format: "%.2f", pitch))")
                Text("Yaw: \(String(format: "%.2f", yaw))")
                Text("Roll: \(String(format: "%.2f", roll))")
            }
            Spacer()
        }
        .onAppear {
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
}

struct DebugView_Previews: PreviewProvider {
    @State static var showingSheet = false
    static var previews: some View {
        DebugView(isPresented: $showingSheet)
    }
}
