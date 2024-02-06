//
//  SearchVC.swift
//  GHFollowers
//
//  Created by ansible on 23/01/2024.
//

import UIKit

class SearchVC: UIViewController {
    
    
    let logoImageView       = UIImageView()
    let usernameTextField   = GFTextField()
    let callToActionButton  = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    //conditional
    var isUsernameEntered: Bool{
        return !usernameTextField.text!.isEmpty //! = if it is not empty
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(logoImageView, usernameTextField, callToActionButton)
        configureLogoImageView()
        configuretextField()
        configureCallToActionButton()
        createDismissKeyboardtapGesture()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = "" //keyboard gone
        navigationController?.setNavigationBarHidden(true,animated: true)
    }
    
    func createDismissKeyboardtapGesture(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        //gesture recognizer
        view.addGestureRecognizer(tap)
    }
    
    //anytime used #selector func need to have @objc
    //pushing new controller onto the stack
    @objc func pushFollowerListVC() {
        
        //if its empty it will not go through the rest of pushFollowers
        guard isUsernameEntered else {
            presentGFAlert(title: "Empty Username", message: "Please Enter username. We need to know who to look for ", buttonTitle: "Ok")
            return
        }
        
        usernameTextField.resignFirstResponder()
        
        
        let followerListVC              = FollowerListVC(username: usernameTextField.text!)
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    
    func configureLogoImageView(){
        logoImageView.translatesAutoresizingMaskIntoConstraints = false //put in custom object only
        logoImageView.image                                     = Images.ghLogo//set image to gh logo //stringly-typed
        
        let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
        
        //set up all constraints
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: topConstraintConstant),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configuretextField(){
        usernameTextField.delegate = self //self means the SearchVC //act on UITextfieldDelegate
        
        NSLayoutConstraint.activate([
            //pin to bottom of logo
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant:48),
            //pin to edges left & right
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            //trailinganchor - bottom
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:  -50),
            //height
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton(){
        //add target need to pass in function tht passes the data (pushFollowrVC is what going to be called
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            //pin button at the bottom
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50),
            //constraint on edges left
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:50),
            //constraint on edges right
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-50),
            //constraint on height
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//pass data to next screen on next screen, next VC
extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //when tap go or when tap getfollowers
        pushFollowerListVC()
        return true
    }
}
