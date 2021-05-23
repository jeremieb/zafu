//
//  QuoteView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 23/05/2021.
//

import SwiftUI

struct QuoteView: View {
    
    private var myQuote = MyQuotes()
    
    var body: some View {
        
        let quoteKey = Int(arc4random_uniform(UInt32(myQuote.quotes.count)))
        let quote = Array(myQuote.quotes.keys)[quoteKey]
        let author = Array(myQuote.quotes.values)[quoteKey]
        
        VStack {
            Text(quote)
                .font(.subheadline)
                .fontWeight(.light)
                .italic()
                + Text(" - ")
                + Text(author)
                .font(.subheadline)
                .fontWeight(.medium)
        }.padding(.horizontal).fixedSize(horizontal: false, vertical: true).lineLimit(5)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
