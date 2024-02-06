//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by ansible on 24/01/2024.
//

import UIKit
import SafariServices

fileprivate var containerView: UIView!

extension UIViewController   {
    
    func presentGFAlert(title: String, message: String, buttonTitle:String){
        
            let alertVC = GFAlertVC(title: title, message: message, buttontitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            present(alertVC,animated: true)
    }
    
    func presentDefaultError() {
            let alertVC = GFAlertVC(title: "Something went wrong", message: "We were unable to complete your task at this time. Please try again. ", buttontitle: "Ok")
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            present(alertVC,animated: true)
    }
    
    func presentSafariVC(with url: URL){
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
