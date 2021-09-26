//
//  LocationManager.swift
//  Weather
//
//  Created by ABDUL BASITH A on 26/09/21.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    static let shared = LocationManager()
    
    var completion :((CLLocation)-> Void)?
    
    func getUserLocation(completion: @escaping ((CLLocation))-> Void) {
        self.completion = completion
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        DispatchQueue.main.async {
            self.location = location
            self.completion?(location)
        }
    }
}
