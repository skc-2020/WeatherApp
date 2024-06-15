//
//  CitiesListService.swift
//  WeatherApp
//
//  Created by SKC on 21.04.2022.
//

import Alamofire

// MARK: - Network Protocol

protocol NetworkProtocol {
    func requestCities(completionHandler: @escaping (Result<[CityModel.City.Country], Error>) -> Void)
}

struct CitiesListService: NetworkProtocol {

    init () {
        print("CitiesListService Inited")
    }

    func requestCities(completionHandler: @escaping (Result<[CityModel.City.Country], Error>) -> Void) {

        let baseURL = "https://countriesnow.space/api/v0.1/countries"

        AF.request(
            baseURL
        )
        .response { responseData in
            guard let data = responseData.data else { return }

            do {
                let citiesData = try JSONDecoder().decode(CityModel.City.self, from: data)
                let countriesArray = citiesData.data
                DispatchQueue.main.async {
                    completionHandler(.success(countriesArray))
                }
            } catch {
                completionHandler(.failure(error))
            }
        }
    }

}
