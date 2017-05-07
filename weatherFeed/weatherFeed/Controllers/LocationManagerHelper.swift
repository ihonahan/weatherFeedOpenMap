//
//  LocationManagerHelper.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManagerHelper: NSObject, CLLocationManagerDelegate {
    
    var delegate: LocationManagerHelperDelegate!
    var authorized = false
    var locationManager: CLLocationManager!
    
    func startGettingLocation() {
        if let manager = self.locationManager {
            if self.authorized {
                manager.startUpdatingLocation()
            } else {
                manager.requestWhenInUseAuthorization()
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            if let del = self.delegate {
                del.locationManagerDidGet(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            }
        }
        
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            self.authorized = true
            manager.startUpdatingLocation()
        }
    }
}
