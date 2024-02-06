//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by ansible on 24/01/2024.
//

import UIKit

class GFBodyLabel: UILabel {

    //passing frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //custom initializer
    //body text label is going to be dynamic type
    convenience init(textAlignment: NSTextAlignment){
        self.init(frame: .zero)
        self.textAlignment = textAlignment //name textAlignment exactly the same thats why call self
    }
    
    private func configure() {
        textColor                                     = .secondaryLabel
        font                                          = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory             = true
        adjustsFontSizeToFitWidth                     = true
        minimumScaleFactor                            = 0.75 //how much you want it to shrink
        lineBreakMode                                 = .byWordWrapping //name too long username turns to ..., can as well use wordwrapping
        translatesAutoresizingMaskIntoConstraints     = false
    }

}
