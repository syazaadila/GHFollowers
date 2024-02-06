//
//  GFSecondaryTitleLabel.swift
//  GHFollowers
//
//  Created by ansible on 31/01/2024.
//

//
//  GFSecondaryTitleLabel.swift
//  GHFollowers
//
//  Created by ansible on 30/01/2024.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {
    
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
    convenience init(fontSize: CGFloat){
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    private func configure() {
        textColor                                     = .secondaryLabel
        font                                          = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth                     = true
        minimumScaleFactor                            = 0.90 //how much you want it to shrink
        lineBreakMode                                 = .byTruncatingTail //name too long username turns to ..., can as well use wordwrapping
        translatesAutoresizingMaskIntoConstraints     = false
    }
}
