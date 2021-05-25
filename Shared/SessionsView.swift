//
//  SessionsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct SessionsView: View {
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(0...10, id: \.self){ _ in
                        CellText()
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width)
            }.navigationTitle("My Sessions")
        }
    }
}

struct CellText: View {
    
    var colors = [Color(UIColor.systemIndigo), Color(UIColor.systemPink), Color(UIColor.systemGreen)]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Test")
            Text("Curabitur blandit tempus porttitor.")
        }
        .frame(width: UIScreen.main.bounds.size.width - 64)
        .padding()
        .background(colors.randomElement()?.opacity(0.1))
        .cornerRadius(20)
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
