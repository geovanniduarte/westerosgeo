//
//  AppDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = .cyan
        window?.makeKeyAndVisible()
        
        
        // Crear los modelo
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons

        // Creamos la tabla de houses
        let houseListViewController = HouseListViewController(model: houses)
        let houseDetailViewControler = HouseDetailViewController(model: houses.first!)
        houseListViewController.delegate = houseDetailViewControler
        
        // Creamos la tabla de seasons
        let seasonListViewController = SeasonListViewController(model: seasons)
        let seasonDetailViewController = SeasonDetailViewController(model: seasons.first!)
        seasonListViewController.delegate = seasonDetailViewController
        
        let masterViewController : UITabBarController = UITabBarController()
        masterViewController.viewControllers = [houseListViewController.wrappedInNavigation(), seasonListViewController.wrappedInNavigation()]
        
        
        let splitViewController: UISplitViewController = UISplitViewController()
        splitViewController.viewControllers = [masterViewController, houseDetailViewControler.wrappedInNavigation()] //OJO MIRAR SI LO PONGO EN WRAP
        
        // Indicamos que split sea delegado de tabbar
        masterViewController.delegate = splitViewController
        
        // Asignamos el rootVC
        window?.rootViewController = splitViewController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

