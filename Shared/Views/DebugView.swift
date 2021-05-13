//
//  DebugView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI
import CoreMotion

struct DebugView: View {
    
    @ObservedObject var motion = MotionProvider()
    
    @Binding var isPresented: Bool
    
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Button(action: { isPresented = false }, label: {
                    Text("Close")
                })
            }.padding()
            List{
                Text("🔥 Pitch: \(String(format: "%.2f", motion.pitch))")
                Text("🔥 Yaw: \(String(format: "%.2f", motion.yaw))")
                Text("🔥 Roll: \(String(format: "%.2f", motion.roll))")
            }
            Spacer()
        }
    }
}

struct DebugView_Previews: PreviewProvider {
    @State static var showingSheet = false
    static var previews: some View {
        DebugView(isPresented: $showingSheet)
    }
}
