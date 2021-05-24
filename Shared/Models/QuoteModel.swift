//
//  QuoteModel.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 24/05/2021.
//

import Foundation

struct QuoteModel: Identifiable {
    
    var id = UUID()
    var theQuote: String
    var theAuthor: String
    
}
