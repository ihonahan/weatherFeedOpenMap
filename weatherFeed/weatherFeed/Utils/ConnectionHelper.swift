//
//  ConnectionHelper.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/7/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit
import Alamofire

class ConnectionHelper {
    static let shared = ConnectionHelper()
    
    func checkConnection(completionHandler: @escaping (Bool) -> ()) {
        if let manager = Alamofire.NetworkReachabilityManager(host: "http://www.google.com") {
            manager.listener = { status in
                var result : Bool
                switch status {
                case .notReachable:
                    result = false
                case .unknown:
                    result = false
                case .reachable(.ethernetOrWiFi):
                    result = true
                case .reachable(.wwan):
                    result = true
                }
                
                manager.stopListening()
                completionHandler(result)
            }
            
            manager.startListening()
        } else {
            completionHandler(false)
        }
    }

}
