//
//  Networker.swift
//  WeatherApp
//
//  Created by AndUser on 06.04.2021.
//

import Alamofire
import CoreLocation

typealias NetworkRequestResult = Result<Weather, FetchWeatherError>

// MARK: - Networker Protocol

protocol NetworkerProtocol {
    func fetchWeather(for city: String, completionHandler: @escaping (NetworkRequestResult) -> Void)
    func fetchWeather(completionHandler: @escaping (NetworkRequestResult) -> Void)
}

// MARK: - Network Service

struct Networker {

    let location: Location

    init (location: Location) {
        self.location = location
    }

    func requestWeather(
        for coordinates: (latitude: Double, longitude: Double),
        completion: @escaping (NetworkRequestResult) -> Void
    ) {
        let baseURL = "https://api.openweathermap.org/data/2.5/onecall"
        let parameters = [
            "appid" : "a64c3f8484fec35c8312f1bce96d8678",
            "exclude" : "minutely",
            "units" : "metric",
            "lat" : "\(coordinates.latitude)",
            "lon" : "\(coordinates.longitude)"
        ]

        AF.request(
            baseURL,
            parameters: parameters
        )
        .response { responseData in
            guard let data = responseData.data else { return }

            do {
                let weatherData = try JSONDecoder().decode(Weather.self, from: data)
                DispatchQueue.main.async {
                completion(.success(weatherData))
                }
            } catch {
                completion(.failure(.connectionIssue))
            }
        }
    }

}

// MARK: - NetworkerProtocol

extension Networker: NetworkerProtocol {

    // MARK: - Fetch Weather using city string

    func fetchWeather(for city: String = "Kyiv", completionHandler: @escaping (NetworkRequestResult) -> Void) {
        location.getCoordinate(of: city) { result in
            switch result {
            case .success(let data):
                requestWeather(
                    for: (latitude: data.latitude, longitude: data.longitude),
                    completion: completionHandler
                )
            case .failure(let error):
                print(error)
            }
        }

    }

    // MARK: - Fetch Weather using coordinates

    func fetchWeather(completionHandler: @escaping (NetworkRequestResult) -> Void) {
        location.setupUserLocation()

        location.coordsHandler = { coords in
            requestWeather(
                for: (latitude: coords.latitude, longitude: coords.longitude),
                completion: completionHandler
            )
        }
    }

}
