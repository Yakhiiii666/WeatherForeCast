//
//  MainDetails.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 24/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import Foundation
struct MainDetails: Decodable {
    let temprature: Double?
    let humidity: Double?
    let pressure: Double?
    let minimumTemprature: Double?
    let maximumTemprature: Double?
    let seaLevel: Double?
    let groundLevel: Double?
    let kfTemprature: Double?
    
    private enum CodingKeys: String, CodingKey {
        case temprature = "temp"
        case humidity
        case pressure
        case minimumTemprature = "temp_min"
        case maximumTemprature = "temp_max"
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case kfTemprature = "temp_kf"
        
    }
}
