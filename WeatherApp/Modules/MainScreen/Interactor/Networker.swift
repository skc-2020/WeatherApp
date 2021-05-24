//
//  Networker.swift
//  WeatherApp
//
//  Created by AndUser on 06.04.2021.
//

import Alamofire

final class Networker {

    func requestWeather(completion: @escaping (Weather) -> Void) {
        let baseURL = "https://api.openweathermap.org/data/2.5/onecall"
        let parameters = [
            "appid" : "a64c3f8484fec35c8312f1bce96d8678",
            "exclude" : "minutely",
            "units" : "metric",
            "lat" : "50.45",
            "lon" : "30.52"
        ]

        AF.request(
            baseURL,
            parameters: parameters
        )
        .response { responceData in
            guard let data = responceData.data else { return }

            do {
                let weatherData = try JSONDecoder().decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    completion(weatherData)
                }
            } catch let error {
                print("Error", error)
            }
        }
    }

}
