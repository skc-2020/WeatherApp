//
//  Networker.swift
//  WeatherApp
//
//  Created by AndUser on 06.04.2021.
//

import Alamofire
import CoreLocation

struct Networker {

    func requestWeather( // TODO: remove default vals
        for coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 50.45, longitude: 30.52),
        completion: @escaping (Result<Weather, FetchWeatherError>) -> Void
    ) {
        let location = Location()

        let baseURL = "https://api.openweathermap.org/data/2.5/onecall"
        let parameters = [
            "appid" : "a64c3f8484fec35c8312f1bce96d8678",
            "exclude" : "minutely",
            "units" : "metric",
            "lat" : "\(coordinate.latitude)",
            "lon" : "\(coordinate.longitude)"
        ]

        AF.request(
            baseURL,
            parameters: parameters
        )
        .response { responceData in
            guard let data = responceData.data else { return }

            location.getCoordinate { result in
                switch result {
                case .success(let data):
                    print(data.latitude)
                case .failure(let error):
                    print(error)
                }
            }
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
