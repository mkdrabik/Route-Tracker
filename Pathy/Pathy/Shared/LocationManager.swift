//
//  LocationManager.swift
//  Pathy
//
//  Created by Mason Drabik on 2/13/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    @Published var hasLocationAccess: Bool = false

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocationAccess() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            hasLocationAccess = false
            print("DEBUG: Not determined")
        case .restricted:
            hasLocationAccess = false
            print("DEBUG: Restricted")
        case .denied:
            hasLocationAccess = false
            print("DEBUG: Denied")
        case .authorizedAlways:
            hasLocationAccess = true
            print("DEBUG: Auth always")
        case .authorizedWhenInUse:
            hasLocationAccess = true
            print("DEBUG: Auth when in use")
        case .authorized:
            hasLocationAccess = true
            print("DEBUG: Auth")
        @unknown default:
            hasLocationAccess = false
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location
    }

    func startFetchingCurrentLocation() {
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
