//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by ansible on 24/01/2024.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView               = GFAlertContainerView()
    let titleLabel                  = GFTitleLabel(textAlignment: .center, fontsize: 20)
    let messageLabel                = GFBodyLabel(textAlignment: .center)
    let actionButton                = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat        = 20
    
    init(title: String, message: String, buttontitle: String){
        super.init(nibName: nil, bundle: nil)
        self.alertTitle             = title
        self.message                = message
        self.buttonTitle            = buttontitle
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //laying out the UI
    override func viewDidLoad() {
        super.viewDidLoad()
        //75% opacity
        view.backgroundColor                = UIColor.black.withAlphaComponent(0.75)
        view.addSubviews(containerView,titleLabel, actionButton, messageLabel)

        // call configure container view = place container view in view controller
        configureContainerView()
        //place titleLabel in container view
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
        
    }
    
    func configureContainerView(){
        
        //constraint for the container view
        //4 constraints per item
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
    }
    
    func configureTitleLabel() {
        
        //pass it
        titleLabel.text = alertTitle ?? "Something went wrong" //nil coalescing = unwrap optional , default backup title
        
        NSLayoutConstraint.activate([
            
            //if we want to change padding just change on up let padding: CGFloat        = 20
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
            
            
            //if we want to change padding just change on up let padding: CGFloat        = 20
        
        ])
    }
    
    func configureActionButton(){

        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding), //trailing always comes with negative 
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureMessageLabel(){
        //setting numbers of line
        messageLabel.text                        = message ?? "Unable to complete request"
        messageLabel.numberOfLines               = 4
        
        //
        NSLayoutConstraint.activate([
            //pin to bottom label
            //pin to top of button
            //pin to leading and trailing
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            //pin at top of action button
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
            
        ])
    }
    
    @objc func dismissVC() {
        //implement how the view shows up, animated cross dissolve
        dismiss(animated:true)
    }

}
