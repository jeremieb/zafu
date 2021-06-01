//
//  QuoteView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 23/05/2021.
//

import SwiftUI

struct QuoteView: View {
    
    var myQuote = MyQuotes()
    
    @State private var quote: QuoteModel = QuoteModel(theQuote: "Empty", theAuthor: "No one")
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(quote.theQuote)
                .font(.title2)
                .fontWeight(.ultraLight)
                .italic()
                .padding(.bottom, 5)
            Text(quote.theAuthor)
                .font(.title3)
                .fontWeight(.light)
        }
        .padding(.horizontal)
        .fixedSize(horizontal: false, vertical: true)
        .lineLimit(10)
        .multilineTextAlignment(.center)
        .onAppear{
            quote = myQuote.quotes.randomElement()!
        }
    }
}

//struct QuoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuoteView()
//            .previewLayout(PreviewLayout.sizeThatFits)
//            .padding()
//            .previewDisplayName("Default preview")
//    }
//}
