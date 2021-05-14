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

    var body: some View {

        HStack(spacing: 20.0){
            Text("🔥 X: \(String(format: "%.2f", motion.x))")
            Text("🔥 Y: \(String(format: "%.2f", motion.y))")
            Text("🔥 Z: \(String(format: "%.2f", motion.z))")
        }.padding()
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView(motion: MotionProvider())
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
