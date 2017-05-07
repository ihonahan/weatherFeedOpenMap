//
//  CitiesViewController.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit
import CoreLocation


class CitiesViewController: UIViewController, CitiesTableHelperDelegate, LocationManagerHelperDelegate {
    @IBOutlet weak var fullContainer: UIView!
    @IBOutlet weak var citiesTable: UITableView!
    
    @IBOutlet weak var connectionContainer: UIView!
    
    @IBOutlet weak var citiesTableHelper: CitiesTableHelper!
    lazy var refresher: UIRefreshControl = {
        let result = UIRefreshControl()
        result.addTarget(self, action: #selector(CitiesViewController.refresherValueChanged(sender:)), for: .valueChanged)
        return result
    }()
    
    let locationManager: CLLocationManager = CLLocationManager()
    let locationHelper = LocationManagerHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.citiesTableHelper.delegate = self
        
        self.locationHelper.delegate = self
        
        self.locationManager.delegate = self.locationHelper
        self.locationHelper.locationManager = self.locationManager
        
        self.connectionContainer.isHidden = false
        self.fullContainer.bringSubview(toFront: self.connectionContainer)

        ConnectionHelper.shared.checkConnection { (status) in
            if status {
                self.locationHelper.startGettingLocation()
            } else {
                self.connectionContainer.isHidden = false
                self.fullContainer.bringSubview(toFront: self.connectionContainer)
            }
        }
        
        self.citiesTable.addSubview(self.refresher)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func refresherValueChanged(sender: UIRefreshControl) {
        ConnectionHelper.shared.checkConnection { (status) in
            if status {
                self.locationHelper.startGettingLocation()
            } else {
                self.connectionContainer.isHidden = false
                self.fullContainer.bringSubview(toFront: self.connectionContainer)
            }
        }
        self.refresher.endRefreshing()
    }
    
    
    //MARK: - LocationManagerHelperDelegate methods
    func locationManagerDidGet(latitude: Double, longitude: Double) {
        self.connectionContainer.isHidden = true
        self.fullContainer.sendSubview(toBack: self.connectionContainer)
        self.citiesTableHelper.loadCities(with: latitude, longitude: longitude, count: 10)
    }
    
    
    //MARK: - CitiesTableHelperDelegate methods
    func citiesTableDataHelperDelegateRequestReload(sender: CitiesTableHelper) {
        self.citiesTable.reloadData()
    }
    
    func citiesTableDataHelperDelegateDidSelect(city: CityData, sender: CitiesTableHelper) {
        self.performSegue(withIdentifier: Util.showCityDetailSegue, sender: city)
    }
    
    
    //MARK: - Navigation methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Util.showCityDetailSegue {
            if let destination = segue.destination as? CityDetailViewController {
                if let cityData = sender as? CityData {
                    destination.cityData = cityData
                }
            }
        }
    }
}
