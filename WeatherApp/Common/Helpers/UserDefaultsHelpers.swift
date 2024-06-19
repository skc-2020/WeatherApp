//
//  UserDefaultsHelpers.swift
//  WeatherApp
//
//  Created by SKC on 10.01.2024.
//

import UIKit

typealias Saved = UserDefaults.Keys

extension UserDefaults {

    enum Keys: String {
        case foundScreenWeather
        case citiesList // list of cities from city API
        case weather
        case weatherForSearchScreen
        case cityForMainScreen
        case favouriteCitiesList // cities that we chose
    }

    func save<T: Encodable>(_ object: T, forKey key: String) {
        do {
            let encodedObject = try JSONEncoder().encode(object)
            defaults.set(encodedObject, forKey: key)
        } catch {
            NSLog("Error! Couldn't encode object: \(object) for key: \(key)!")
        }
    }

// swiftlint:disable force_cast
    func loadObject<T: Decodable>(forKey key: String, type: T.Type) -> T {
        guard let savedData = defaults.data(forKey: key) else {
            NSLog("Error, couldn't get saved data from the UserDefaults")
            return [] as! T
        }
        do {
            let decodedArray = try JSONDecoder().decode(T.self, from: savedData)
            return decodedArray
        } catch {
            NSLog("Error! Couldn't decode an object: \(savedData) for key: \(key) of type: \(type)!")
        }
        return [] as! T
    }

    func load<T: Decodable>(forKey key: String, type: T.Type) -> T {
        guard let savedData = defaults.data(forKey: key) else {
            NSLog("Error, couldn't get saved data from the UserDefaults")
            return T.self as! T
        }
        do {
            let decodedArray = try JSONDecoder().decode(T.self, from: savedData)
            return decodedArray
        } catch {
            NSLog("Error! Couldn't decode an object: \(savedData) for key: \(key)!")
        }
        return T.self as! T
    }

}
