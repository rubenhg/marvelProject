//
//  AppDelegate.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController(rootViewController: MarvelListWireframe.build())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }


}

