//
//  QuotesView.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 05/02/2021.
//

import SwiftUI

struct QuotesView: View {
    
    private var myQuote = MyQuotes()
    
    @EnvironmentObject var myTimer: TimerViewModel
    
    private var isStarted: Bool {
        return myTimer.isStarted
    }
    
    var body: some View {
        
        let quoteKey = Int(arc4random_uniform(UInt32(myQuote.quotes.count)))
        let quote = Array(myQuote.quotes.keys)[quoteKey]
        let author = Array(myQuote.quotes.values)[quoteKey]
        
        VStack {
            if isStarted {
                EmptyView()
            } else {
                ZStack {
                    HStack {
                        Image("icn-quotes")
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text(quote).font(.system(size: 28, weight: .heavy, design: .serif))
                        HStack {
                            Spacer()
                            Text(author)
                                .font(.system(size: 18, weight: .bold, design: .serif))
                                .italic()
                                .multilineTextAlignment(.trailing)
                        }.padding(.top, 1)
                    }.padding(.top, 80).foregroundColor(.mainColor)
                }
                GeometryReader { geometry in
                    Spacer().frame(height: geometry.size.height / 2.5)
                }
            }
        }.padding(.horizontal, 28)
    }

}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuotesView()
                .environmentObject(TimerViewModel())
            QuotesView()
                .environmentObject(TimerViewModel())
                .preferredColorScheme(.dark)
        }
            
    }
}
