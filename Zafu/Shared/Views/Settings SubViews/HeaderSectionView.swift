//
//  HeaderSectionView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 18/02/2021.
//

import SwiftUI

struct HeaderSectionView: View {
    var title: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.mainColor.opacity(0.3)
                HStack {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .foregroundColor(.headersColor)
                        .multilineTextAlignment(.leading)
                        .textCase(.uppercase)
                    Spacer()
                }.padding(.horizontal)
                
            }.frame(minWidth: geo.size.width, minHeight: 20)
        }
    }
}

struct HeaderSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSectionView(title: "My Title")
    }
}
