//
//  QuoteViewOwner.swift
//  TODO_Closure
//
//  Created by MacBook Two on 18/12/2024.
//

import UIKit

class QuoteViewOwner: UIView {

    @IBOutlet var view : UIView!
    @IBOutlet var quoteLabel : UILabel!
    @IBOutlet var authorLabel : UILabel!
    
    @IBOutlet var errorLabel : UILabel!
    
    var nextBtntapped : (()->Void)?
    var previousBtnTapped : (()->Void)?
    
   
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    

    @IBAction func nextBtnTapped(_ sender: Any) {
        nextBtntapped?()
    }
    
    
    @IBAction func previousBtnTappped(_ sender: Any) {
        previousBtnTapped?()
    }
    
    
}
