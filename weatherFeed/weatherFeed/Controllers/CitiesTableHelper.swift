//
//  CitiesTableHelper.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class CitiesTableHelper: NSObject, UITableViewDelegate, UITableViewDataSource {

    var delegate: CitiesTableHelperDelegate!
    var cities: [CityData]!
    
    
    func loadCities(with latitude: Double, longitude: Double, count: Int) {
        WeatherFeedService.shared.getFeedFrom(latitude: latitude, longitude: longitude, count: count) { (success, cityData) in
            if success {
                self.cities = cityData
                if let del = self.delegate {
                    del.citiesTableDataHelperDelegateRequestReload(sender: self)
                }
            }
        }
    }

    
    //MARK: - UITableView Delegate and DataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array = self.cities {
            return array.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.identifier, for: indexPath) as! CitiesTableViewCell
        
        let item = self.cities[indexPath.row]
        
        cell.cityNameLabel.text = item.name
        cell.weatherDescriptionLabel.text = item.weatherDescription
        cell.iconImageView.image = item.weatherIcon
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let del = self.delegate {
            let city = self.cities[indexPath.row]
            del.citiesTableDataHelperDelegateDidSelect(city: city, sender: self)
        }
    }
}
