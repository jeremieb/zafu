//
//  SessionsView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 16/05/2021.
//

import SwiftUI

struct SessionsView: View {
    var body: some View {
        
        VStack {
            HeaderMainView(title: "My Sessions")
            Spacer()
        }
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
