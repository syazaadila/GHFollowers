//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by ansible on 06/02/2024.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread(){
        DispatchQueue.main.async{ self.reloadData()}
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
