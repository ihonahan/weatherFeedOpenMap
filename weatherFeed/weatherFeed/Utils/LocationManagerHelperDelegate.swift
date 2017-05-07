//
//  LocationManagerHelperDelegate.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

protocol LocationManagerHelperDelegate {
    func locationManagerDidGet(latitude: Double, longitude: Double)
}
