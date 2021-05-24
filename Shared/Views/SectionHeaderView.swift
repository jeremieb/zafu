//
//  SectionHeaderView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 15/05/2021.
//

import SwiftUI

struct SectionHeaderView: View {
    
    var title: String = "Header title"

    var body: some View{
        VStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .padding()
                .frame(width: UIScreen.main.bounds.size.width, height: 22, alignment: .leading)
        }
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SectionHeaderView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
            SectionHeaderView()
                .preferredColorScheme(.dark)
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")
        }
    }
}
