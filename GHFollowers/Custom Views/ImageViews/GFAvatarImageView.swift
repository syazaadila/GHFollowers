//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by ansible on 29/01/2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImager = Images.placeholder
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds      = true
        image              = placeholderImager
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(fromURL url: String) {
        Task {
            image = await NetworkManager.shared.downloadImage(from: url) ?? placeholderImager
        }
    }
}
