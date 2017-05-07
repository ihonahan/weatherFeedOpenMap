//
//  CityDetailViewController.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/7/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet weak var fullContainer: UIView!
    
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var mainDescriptionContainer: UIView!
    @IBOutlet weak var weatherIconView: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!

    @IBOutlet weak var weatherDescriptionLabel: UILabel!

    @IBOutlet weak var weatherDetailContainer: UIView!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    @IBOutlet weak var mediumTemperatureLabel: UILabel!
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windVelocityLabel: UILabel!
    
    var cityData: CityData!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fillDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func fillDetails() {
        if let detail = self.cityData {
            self.cityNameLabel.text = detail.name
            
            self.weatherIconView.image = detail.weatherIcon
            self.currentTemperatureLabel.text = String(format: "%.0fº", detail.currentTemperature)
            
            self.weatherDescriptionLabel.text = detail.weatherDescription
            
            self.minimumTemperatureLabel.text = String(format: "%.0fº", detail.minimumTemperature)
            self.mediumTemperatureLabel.text = String(format: "%.0fº", detail.currentTemperature)
            self.maximumTemperatureLabel.text = String(format: "%.0fº", detail.maximumTemperature)
            
            self.humidityLabel.text = String(format: "%.0f%", (detail.humidity * 100.0))
            self.pressureLabel.text = String(format: "%.0f", detail.pressure)
            self.windVelocityLabel.text = String(format: "%.1f", detail.windVelocity)
        }
    }

    @IBAction func tapUpBack(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
