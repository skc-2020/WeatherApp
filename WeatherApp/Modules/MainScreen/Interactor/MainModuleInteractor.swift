//
//  MainModuleInteractor.swift
//  WeatherApp
//
//  Created by AndUser on 15.03.2021.
//

import CoreLocation

// MARK: - MainModuleInteractorInput

struct MainModuleInteractor: MainModuleInteractorInput {

    // MARK: - Private variables

    private let location = Location()

    var output: SelectAddressMapInteractorOutput!

    // MARK: - Get Current, Hourly, Daily Weather

    func getCurrentWeather(completionHandler: @escaping (Result<Weather, FetchWeatherError>) -> Void) {
        Networker().requestWeather(completion: completionHandler)
    }

    func obtainCurrentLocation() {
        location.setupUserLocation { result in
            switch result {
            case let .success(response):
                self.output.didObtainCurrentLocation(
                    coordinates: response
                )
//            print(response)
            case let .failure(error):
                print(error)
            }
        }
    }

    func obtainCoordinates(address: String) {
//        if let coordinate = address.coordinate {
//            output.didObtainCoordinates(coordinates: coordinate)
//        } else {
            
//        CLGeocoder().geocodeAddressString(address) { [weak self] coordinate in
//            guard let self = self else { return }
//
//            if let coordinate = coordinate {
//                self.output.didObtainCoordinates(coordinates: coordinate)
//            } else {
//                self.output.didFailToObtainCoordinates(error: CommonError.noData)
//            }
//        }
        location.getCoordinate { coordinate in
            print(coordinate)
        }
    }

}
