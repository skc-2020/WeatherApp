//
//  Networker.swift
//  WeatherApp
//
//  Created by AndUser on 06.04.2021.
//

import Alamofire
import CoreLocation
import UIKit

struct Networker {

    func requestWeather(completion: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
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
                    completion(.success(weatherData))
                }
            } catch {
                completion(.failure(.connectionIssue))
            }
        }
    }

}

// MARK: - Location

final class Location: NSObject, CLLocationManagerDelegate {

    var manager = CLLocationManager()
    var coordinates = CLLocationCoordinate2D()

    func getUserLocation() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else { return }

        coordinates = first.coordinate
    }

    func getCoordinate(addressString : String,
                       completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { placemarks, error in
            if error == nil {
                if let placemark = placemarks?[0],
                   let location = placemark.location {
                    completionHandler(location.coordinate, nil)
                    return
                }
            }

            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }

}
