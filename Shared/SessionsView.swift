//
//  SessionsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct SessionsView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.mainPurple)]
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading){
//                    ForEach(0...10, id: \.self){ _ in
//                        CellText()
//                    }
                    EmptyView()
                }
                .frame(width: UIScreen.main.bounds.size.width)
            }
            .navigationTitle("My Sessions")
            .background(BackgroundView())
        }
    }
}



struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
