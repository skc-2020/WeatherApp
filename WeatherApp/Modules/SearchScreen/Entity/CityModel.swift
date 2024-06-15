//
//  CityModel.swift
//  WeatherApp
//
//  Created by SKC on 20.04.2022.
//

struct CityModel: Decodable {

    struct City: Decodable {
        let error: Bool
        let msg: String
        let data: [Country]

        struct Country: Decodable {
            let iso2: String
            let iso3: String
            let country: String
            let cities: [String]
        }
    }

}
