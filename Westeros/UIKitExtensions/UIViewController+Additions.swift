//
//  UIViewController+Additions.swift
//  Westeros
//
//  Created by Alexandre Freire on 13/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

extension UIViewController {
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}

extension UISplitViewController : UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let masterViewController = (viewController as! UINavigationController).viewControllers[0]
        let detailViewController : UIViewController
        
        if masterViewController is HouseListViewController {
            detailViewController = (masterViewController as! HouseListViewController).delegate as! UIViewController
        } else {
            detailViewController = (masterViewController as! SeasonListViewController).delegate as! UIViewController
            
        }
        self.viewControllers[1] =  detailViewController.wrappedInNavigation()
    }
}

extension Date {
    func formattedDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = dateFormatter.string(from: self)
        return date
    }
}
