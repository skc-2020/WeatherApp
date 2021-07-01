//
//  Errors.swift
//  WeatherApp
//
//  Created by AndUser on 21.06.2021.
//

public enum FetchWeatherError: String, Error {

    case connectionIssue = "There was connection issue"
    case requestIssue = "There's an error in request"

}
