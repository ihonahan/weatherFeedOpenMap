//
//  WeatherFeedService.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit
import  Alamofire


class WeatherFeedService {
    static let shared = WeatherFeedService()
    
    let url = "http://api.openweathermap.org/data/2.5/find?lat=%f&lon=%f&cnt=%d&appid=%@&units=metric"
    
    let apiKey = "22b42ff56561d9709106fadab9ce33fc"
    
    func getFeedFrom(latitude: Double, longitude: Double, count: Int, completionHandler: @escaping (Bool, [CityData]?) -> ()) {
        let requestUrl = String(format: self.url, latitude, longitude, count, self.apiKey)
        
        Alamofire.request(requestUrl, method: .get, parameters: nil).responseJSON { (response) in
            if response.result.error != nil {
                completionHandler(false, nil)
            } else {
                if let json = response.result.value as? [String:AnyObject] {
                    if let list = json["list"] as? [[String:AnyObject]] {
                        var cities = [CityData]()

                        for item in list {
                            let city = self.parseJsonToCityData(item: item)
                            cities.append(city)
                        }

                        completionHandler(true, cities)
                    } else {
                        completionHandler(false, nil)
                    }
                } else {
                    completionHandler(false, nil)
                }
            }
        }
    }
    
    func parseJsonToCityData(item: [String:AnyObject]) -> CityData {
        var idCity: Int = 0
        var cityName: String = ""
        var lat: Double = 0
        var lon: Double = 0
        var minTemp: Double = 0
        var maxTemp: Double = 0
        var curTemp: Double = 0
        var press: Double = 0
        var humid: Double = 0
        var windVel: Double = 0
        var desc: String = ""
        var iconCode: Int = 0
        var icon: UIImage = UIImage()
        
        if let value = item["id"] as? Int {
            idCity = value
        }
        if let value = item["name"] as? String {
            cityName = value
        }
        
        if let coord = item["coord"] as? [String:AnyObject] {
            if let value = coord["lat"] as? Double {
                lat = value
            }
            if let value = coord["lon"] as? Double {
                lon = value
            }
        }
        
        if let main = item["main"] as? [String:AnyObject] {
            if let value = main["temp"] as? Double {
                curTemp = value
            }
            if let value = main["temp_min"] as? Double {
                minTemp = value
            }
            if let value = main["temp_max"] as? Double {
                maxTemp = value
            }
            if let value = main["humidity"] as? Double {
                humid = value
            }
            if let value = main["pressure"] as? Double {
                press = value
            }
        }
        
        if let wind = item["wind"] as? [String:AnyObject] {
            if let value = wind["speed"] as? Double {
                windVel = value
            }
        }
        
        if let weather = item["weather"] as? [[String:AnyObject]] {
            let first = weather[0]
            if let value = first["id"] as? Int {
                iconCode = value
            }
            if let value = first["description"] as? String {
                desc = value
            }
            
            icon = Util.iconWeather(code: iconCode)
        }
        
        let city = CityData(idCity: idCity,
                            name: cityName,
                            latitude: lat,
                            longitude: lon,
                            minimumTemperature: minTemp,
                            maximumTemperature: maxTemp,
                            currentTemperature: curTemp,
                            pressure: press,
                            humidity: humid,
                            windVelocity: windVel,
                            weatherIcon: icon,
                            weatherDescription: desc)

        return city
    }

}
