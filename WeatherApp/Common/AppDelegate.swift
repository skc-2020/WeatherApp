//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by AndUser on 11.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = MainModuleAssembly.buildModule()
        window?.makeKeyAndVisible()
        return true
    }

}
