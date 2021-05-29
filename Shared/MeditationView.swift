//
//  MeditationView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct MeditationView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.mainPurple)]
    }
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(0...10, id: \.self){ _ in
                        CellText()
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width)
            }.navigationTitle("Meditations")
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
