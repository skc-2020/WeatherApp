//
//  Location.swift
//  WeatherApp
//
//  Created by SKC on 06.07.2021.
//

import CoreLocation

final class Location: NSObject, CLLocationManagerDelegate {

    typealias CurrentLocationRequestResult = Result<CLLocationCoordinate2D, NSError>

    private var manager: CLLocationManager!
    var coordsHandler: ((CLLocationCoordinate2D) -> Void)?

    override init() {
        print("Location Inited")
    }

    deinit {
        print("Location De-Inited")
    }

    func setupUserLocation() {
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else { return }

        coordsHandler?(first.coordinate)
    }

    func getCoordinate(of addressString: String,
                       completionHandler: @escaping(CurrentLocationRequestResult) -> Void ) {
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
