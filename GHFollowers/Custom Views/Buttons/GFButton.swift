//
//  GFButton.swift
//  GHFollowers
//
//  Created by ansible on 23/01/2024.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        //calling default,parent class
        //call normal init method on UIbutton
        super.init(frame: frame)
        configure()
        //custom code GFButton is the child of parent class (UI Button)
        
    }
    //when initialize gf button using storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String){
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor //self means the gf button
        self.setTitle(title, for: .normal)
    }
    
    //can only be called in this class = private, cannot be called outside of the initialization
    private func configure(){
        layer.cornerRadius                           = 10
        titleLabel?.font                             = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints    = false
    }
    
    func set(backgroundColor: UIColor, title: String){
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
}


