//
//  MeditationView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct MeditationView: View {
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderMainView(title: "Meditation")
                Spacer()
            }
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
