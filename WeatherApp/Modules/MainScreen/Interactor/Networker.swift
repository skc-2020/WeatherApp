//
//  Networker.swift
//  WeatherApp
//
//  Created by AndUser on 06.04.2021.
//

import Foundation

final class Networker {

    func requestWeather(completion: @escaping (Weather) -> Void) {
        var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/onecall")
        let queryItems: [URLQueryItem]? = [
            URLQueryItem(name: "exclude", value: "minutely"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "a64c3f8484fec35c8312f1bce96d8678"),
            URLQueryItem(name: "lat", value: "50.45"),
            URLQueryItem(name: "lon", value: "30.52")
        ]

        urlComponents?.queryItems = queryItems

        guard let url = urlComponents?.url else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            do {

                guard response != nil else { return }

                guard let data = data else { return }

                let weatherData = try JSONDecoder().decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    completion(weatherData)
                }
            } catch let error {
                print("Error", error)
            }
        }
        task.resume()
    }

}
