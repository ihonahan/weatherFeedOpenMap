//
//  Util.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class Util {

    static let showCityDetailSegue = "showCityDetail"
    
    
    static func iconWeather(code:Int) -> UIImage {
        switch code {
        case 200..<300:
            return UIImage(named: "windy_rainy")!
        case 300..<400:
            return UIImage(named: "sun_rainy")!
        case 500..<600:
            return UIImage(named: "rainy")!
        case 800:
            return UIImage(named: "sunny")!
        case 801..<810:
            return UIImage(named: "sun_cloudy")!
        default:
            return UIImage(named: "sun_cloudy_wind")!
        }
    }
    
    static func getFormattedDate(from date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let result = formatter.string(from: date)
        
        return result
    }

}
