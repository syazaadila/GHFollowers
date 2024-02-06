//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by ansible on 05/02/2024.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNC(),createFavoritesNC()]
    }
    
    //return ui navigation controller with searchVC
    func createSearchNC() -> UINavigationController{
        
        let searchVC = SearchVC() //replace whats on above
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNC() -> UINavigationController{
        
        //local = FavoritesListVC is a view controller class representing the content to be displayed when the "Favorites" tab is selected.
        let favoritesListVC = FavoritesListVC()
        favoritesListVC.title = "Favorites"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesListVC)
    }
}

