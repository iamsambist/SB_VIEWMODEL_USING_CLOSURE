//
//  ViewController.swift
//  TODO_Closure
//
//  Created by MacBook Two on 18/12/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteView : QuoteViewOwner!
    
    var quoteViewModel : QuoteViewModel?
    var errorLabelHiddenStatus : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        quoteViewModel = QuoteViewModel()
        quoteViewModel?.updateData = { dataSet in
            self.setUpQuoteViewWithUpdatedData(dataSet: dataSet)
        }
        quoteViewModel?.showErrorMessage = { message in
            self.setUpErrorLabel(message: message)
        }
        setupQuoteView()
        
    }
    func setupQuoteView(){
        quoteView.errorLabel.isHidden = errorLabelHiddenStatus
        quoteViewModel?.loadInitialDataSet()
        quoteView.nextBtntapped = {
            self.removeErrorLabel()
            self.quoteViewModel?.fetchNextDataSet()
        }
        quoteView.previousBtnTapped = {
            self.removeErrorLabel()
            self.quoteViewModel?.fetchPreviousDataSet()
        }
    
    }
    func removeErrorLabel(){
        quoteView.errorLabel.isHidden = errorLabelHiddenStatus
        quoteView.errorLabel.text = ""
    }
    func setUpErrorLabel(message : String){
        quoteView.errorLabel.isHidden = !errorLabelHiddenStatus
        quoteView.errorLabel.text = message
    }
    
    func setUpQuoteViewWithUpdatedData(dataSet : DataSet){
        quoteView.quoteLabel.text = dataSet.quote
        quoteView.authorLabel.text = dataSet.quthor
    }


}

