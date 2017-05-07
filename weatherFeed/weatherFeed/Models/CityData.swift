//
//  CityData.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

struct CityData {
    var idCity: Int
    var name: String
    var latitude: Double
    var longitude: Double
    var minimumTemperature: Double
    var maximumTemperature: Double
    var currentTemperature: Double
    var pressure: Double
    var humidity: Double
    var windVelocity: Double
    var weatherIcon: UIImage
    var weatherDescription: String
}
