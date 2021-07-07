//
//  Location.swift
//  WeatherApp
//
//  Created by AndUser on 06.07.2021.
//

import CoreLocation

final class Location: NSObject, CLLocationManagerDelegate {

    private let manager = CLLocationManager()
    private var coordinates = CLLocationCoordinate2D()

    func setupUserLocation() {
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
                       completionHandler: @escaping(Result<CLLocationCoordinate2D, NSError>) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { placemarks, error in
            if error == nil {
                guard let placemark = placemarks?[safe: 0],
                      let location = placemark.location else { return }
                completionHandler(.success(location.coordinate))
                return
            }

            completionHandler(.success(kCLLocationCoordinate2DInvalid))
        }
    }

}
