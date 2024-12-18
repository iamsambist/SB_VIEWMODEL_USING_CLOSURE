//
//  QuoteSource.swift
//  QUOTE_PROTOCOL
//
//  Created by MacBook Two on 17/12/2024.
//

import Foundation
struct QuoteSource {
    
    // MARK: - STORED PROPERTIES
    var quotes : [Quote] = [] {
        didSet {
            count = quotes.count
        }
    }
    
    var count : Int = 0 {
        didSet {
            print("Array Size = \(count)")
        }
    }
    
    
    init() {
        self.quotes = [
            Quote(quote: "To live is the rarest thing in the world. Most people exist, that is all", WrittenBy: "Oscar Wilde"),
            Quote(quote: "That it will never come again is what makes life so sweet.", WrittenBy: "Emily Dickinson"),
            Quote(quote: "It is never too late to be what you might have been.", WrittenBy: "George Eliot"),
            Quote(quote: "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment", WrittenBy: "Ralph Waldo Emerson"),
            Quote(quote: "Pain is inevitable. Suffering is optional", WrittenBy: "Haruki Murakami")
            
        ]
    }
    func fetchNextDataSet(index : Int) -> Quote? {
        if index < quotes.count {
            return quotes[index]
        }
        return nil
    }
    
    func fetchPreviousDataSet(index : Int) -> Quote? {
        if index >= 0 {
            return quotes[index]
        }
        return nil
    }
    
}
