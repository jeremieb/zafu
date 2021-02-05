//
//  QuotesView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 05/02/2021.
//

import SwiftUI

struct QuotesView: View {
    
    
    /// TODO: Random quotes
    private var quote = "Feelings come and go like clouds in a windy sky. Conscious breathing is my anchor."
    private var author = "Thich Nhat Hahn"
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Image("icn-quotes")
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text(quote).font(.system(size: 28, weight: .heavy, design: .serif))
                    HStack {
                        Spacer()
                        Text(author).font(.system(size: 28, weight: .bold, design: .serif).italic()).multilineTextAlignment(.trailing)
                    }
                }.padding(.top, 80).foregroundColor(.mainColor)
            }
            Spacer()
        }.padding(.horizontal, 28)
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuotesView()
            QuotesView()
                .preferredColorScheme(.dark)
        }
            
    }
}
