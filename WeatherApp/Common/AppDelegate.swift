//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by SKC on 11.03.2021.
//

import UIKit

//TODO: - Rework!
public var navController = UINavigationController()
let defaults = UserDefaults.standard

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        navController = UINavigationController(rootViewController: MainModuleAssembly.buildModule())
        window?.rootViewController = navController

        window?.makeKeyAndVisible()
        return true
    }

}
