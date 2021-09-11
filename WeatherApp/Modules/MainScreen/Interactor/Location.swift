//
//  Location.swift
//  WeatherApp
//
//  Created by AndUser on 06.07.2021.
//

import CoreLocation

final class Location: NSObject, CLLocationManagerDelegate {

    typealias CurrentLocationRequestResult = Result<CLLocationCoordinate2D, NSError>

    private let manager = CLLocationManager()
    private var coordinates = CLLocationCoordinate2D()

    func setupUserLocation(completion: @escaping (CurrentLocationRequestResult) -> Void) {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    private func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) -> CLLocationCoordinate2D {
        guard let first = locations.first else { return CLLocationCoordinate2D() }

        coordinates = first.coordinate
        return coordinates
    }

    func getCoordinate(addressString : String = "Kyiv",
                       completionHandler: @escaping(Result<CLLocationCoordinate2D, NSError>) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { placemarks, error in
            guard error == nil else {
                completionHandler(.success(kCLLocationCoordinate2DInvalid))
                return
            }
            guard let placemark = placemarks?[safe: 0],
                  let location = placemark.location
            else {
                return
            }
            completionHandler(.success(location.coordinate))
        }
    }

}
