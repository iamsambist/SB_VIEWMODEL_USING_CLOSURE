//
//  QuoteViewModel.swift
//  TODO_Closure
//
//  Created by MacBook Two on 18/12/2024.
//
import Foundation

struct DataSet {
    var quote : String
    var quthor : String
}

class QuoteViewModel {
    
  
    var dataSource : QuoteSource?
    
    // MARK: - Stored Property : class variables which store values
    var currentQuoteIndex : Int = 0
    
    var updateData : ((DataSet) -> Void)?
    var showErrorMessage : ((String) -> Void)?
    
    init() {
        self.dataSource = QuoteSource()
    }
    
    func loadInitialDataSet(){
        let data = dataSource?.quotes[0]
        guard let unWrappedQuote = data?.quote,
              let unWrappedAuthor = data?.WrittenBy else {
            return
        }
        updateData?(DataSet(quote: unWrappedQuote, quthor: unWrappedAuthor))
       
    }
    
    func fetchNextDataSet(){
        let nextIndex = currentQuoteIndex + 1
        let data =  dataSource?.fetchNextDataSet(index: nextIndex)
        guard let unWrappedData = data else {
            showErrorMessage?("NO MORE DATA LEFT TO SHOW")
            return
        }
        updateData?(DataSet(quote: unWrappedData.quote, quthor: unWrappedData.WrittenBy))
        currentQuoteIndex = currentQuoteIndex + 1
       
        
    }
    
    func fetchPreviousDataSet() {
        let nextIndex = currentQuoteIndex - 1
        let data =  dataSource?.fetchPreviousDataSet(index: nextIndex)
        if let unWrappData = data {
            currentQuoteIndex = currentQuoteIndex - 1
            updateData?(DataSet(quote: unWrappData.quote, quthor: unWrappData.WrittenBy))
        } else {
            showErrorMessage?("NO MORE DATA AHEAD TO SHOW")
        }
     
    }
    
    
}

