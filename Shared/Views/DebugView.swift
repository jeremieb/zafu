//
//  DebugView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 13/05/2021.
//

import SwiftUI
import CoreMotion

struct DebugView: View {
    
    @ObservedObject var motion: MotionProvider
    
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
                Text("🔥 X: \(String(format: "%.2f", motion.x))")
                Text("🔥 Y: \(String(format: "%.2f", motion.y))")
                Text("🔥 Z: \(String(format: "%.2f", motion.z))")
            }
            Spacer()
        }
    }
}

struct DebugView_Previews: PreviewProvider {
    @State static var showingSheet = false
    static var previews: some View {
        DebugView(motion: MotionProvider(), isPresented: $showingSheet)
    }
}
