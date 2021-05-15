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
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(Color("elementSecondary"))
                .multilineTextAlignment(.leading)
                .textCase(.uppercase)
                .lineLimit(1)
                .padding()
                .frame(width: UIScreen.main.bounds.size.width, height: 22, alignment: .leading)
        }
        .padding(.top, 16)
        .padding(.bottom, 5)
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
