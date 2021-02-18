//
//  FooterView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 18/02/2021.
//

import SwiftUI

struct FooterView: View {
    
    private var heart = Image(systemName: "heart.fill")
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Made with \(heart) in Amsterdam")
                .font(.system(size: 12, weight: .semibold, design: .serif))
                .foregroundColor(.mainColor)
            Image("amsterdam")
        }.padding(.vertical)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
