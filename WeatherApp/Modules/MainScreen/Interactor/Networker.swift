//
//  Networker.swift
//  WeatherApp
//
//  Created by AndUser on 06.04.2021.
//

import Moya

enum Networker: TargetType {

    case requestWeather

    var baseURL: URL {
        URL(string: "https://api.openweathermap.org/data/2.5/onecall")!
    }

    var path: String {
        ""
    }

    var method: Moya.Method {
        .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case .requestWeather:
            return .requestParameters(
                parameters: [
                    "appid" : "a64c3f8484fec35c8312f1bce96d8678",
                    "lat" : "50.45",
                    "lon" : "30.52",
                    "exclude" : "minutely",
                    "units" : "metric"
                ],
                encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        nil
    }

}
