//
//  MainModuleInteractorOutput.swift
//  WeatherApp
//
//  Created by AndUser on 26.07.2021.
//

import CoreLocation

protocol SelectAddressMapInteractorOutput: AnyObject {

    func didObtainCoordinates(coordinates: CLLocationCoordinate2D)
    func didObtainCurrentLocation(coordinates: CLLocationCoordinate2D)

}
