//
//  SessionDetailView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 24/05/2021.
//

import SwiftUI

struct SessionDetailView: View {
    
    var title: String = ""
    
    
    var body: some View {
        VStack{
            HeaderMainView(title: title)
            
            Spacer()
        }
        .background(BackgroundView().opacity(0.4))
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailView()
    }
}
