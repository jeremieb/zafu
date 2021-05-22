//
//  MeditationView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct MeditationView: View {
    
    
    init(){
        UINavigationBar.appearance().barTintColor = UIColor(Color.clear)
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                BackgroundView()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .navigationTitle("Meditations")
            }
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
