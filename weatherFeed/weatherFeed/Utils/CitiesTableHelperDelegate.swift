//
//  CitiesTableDataHelperDelegate.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

protocol CitiesTableHelperDelegate {
    func citiesTableDataHelperDelegateRequestReload(sender: CitiesTableHelper)
    func citiesTableDataHelperDelegateDidSelect(city: CityData, sender: CitiesTableHelper)
}
