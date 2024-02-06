//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by ansible on 24/01/2024.
//

import UIKit

class GFTitleLabel: UILabel {

    //passing frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //custom initializer
    convenience init(textAlignment: NSTextAlignment, fontsize: CGFloat){
        self.init(frame: .zero)
        self.textAlignment = textAlignment //name textAlignment exactly the same thats why call self
        self.font = UIFont.systemFont(ofSize: fontsize,weight: .bold) //set font on label
    }
    
    private func configure() {
        textColor                                     = .label
        adjustsFontSizeToFitWidth                     = true
        minimumScaleFactor                            = 0.9 //how much you want it to shrink
        lineBreakMode                                 = .byTruncatingTail //name too long username turns to ..., can as well use wordwrapping
        translatesAutoresizingMaskIntoConstraints     = false
    }
}
