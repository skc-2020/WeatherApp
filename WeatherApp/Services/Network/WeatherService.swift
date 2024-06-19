//
//  WeatherService.swift
//  WeatherApp
//
//  Created by SKC on 06.04.2021.
//

import Alamofire
import CoreLocation

typealias WeatherRequestResult = Result<Weather, FetchWeatherError>

// MARK: - WeatherService Protocol

protocol WeatherServiceProtocol {
    func requestWeather(for city: String, completionHandler: @escaping (WeatherRequestResult) -> Void)
    func requestWeather(completionHandler: @escaping (WeatherRequestResult) -> Void)
}

// MARK: - Weather Service

struct WeatherService {

    let location: Location

    init (location: Location) {
        self.location = location
    }

    func requestWeather(
        by coordinates: (latitude: Double, longitude: Double),
        completion: @escaping (WeatherRequestResult) -> Void
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

// MARK: - WeatherServiceProtocol

extension WeatherService: WeatherServiceProtocol {

    // MARK: Fetch Weather using city string

    func requestWeather(
        for city: String = "Kyiv",
        completionHandler: @escaping (WeatherRequestResult) -> Void
    ) {
        location.getCoordinate(of: city) { result in
            switch result {
            case .success(let data):
                requestWeather(
                    by: (latitude: data.latitude, longitude: data.longitude),
                    completion: completionHandler
                )
            case .failure(let error):
                print(error)
            }
        }

    }

    // MARK: Fetch Weather using coordinates

    func requestWeather(completionHandler: @escaping (WeatherRequestResult) -> Void) {
        location.setupUserLocation()

        location.coordsHandler = { coords in
            requestWeather(
                by: (latitude: coords.latitude, longitude: coords.longitude),
                completion: completionHandler
            )
        }
    }

}
