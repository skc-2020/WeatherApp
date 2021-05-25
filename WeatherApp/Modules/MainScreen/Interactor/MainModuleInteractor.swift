//
//  MainModuleInteractor.swift
//  WeatherApp
//
//  Created by AndUser on 15.03.2021.
//

import Moya
// MARK: - MainModuleInteractorProtocol

protocol MainModuleInteractorProtocol {
    func getCurrentWeather(completionHandler: @escaping (Weather) -> Void)
}

struct MainModuleInteractor: MainModuleInteractorProtocol {

    private let networkService = MoyaProvider<Networker>()

    // MARK: - Get Current, Hourly, Daily Weather

    func getCurrentWeather(completionHandler: @escaping (Weather) -> Void) {
        networkService.request(.requestWeather) { result in
            switch result {
            case .success(let response):
                guard let weatherData = try? JSONDecoder().decode(
                    Weather.self, from: response.data
                )
                else {
                    print("There was an error in decoding")
                    return
                }
                completionHandler(weatherData)

            case .failure(let error):
                print("There was an error in getting weather from api: \(error)")
            }
        }
    }

}
