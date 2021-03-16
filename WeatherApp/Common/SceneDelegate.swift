//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by AndUser on 11.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let rootScreen = MainModuleAssembly.buildModule(
            with: Weather.DailyModel(
                locationName: "test",
                cloudiness: "",
                temperature: "",
                maxTemperature: "",
                minTemperature: "",
                humidity: "",
                description: ""
            )
        )

        window?.rootViewController = rootScreen
    }

}
