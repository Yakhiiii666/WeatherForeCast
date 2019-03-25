//
//  File.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 24/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import Foundation
struct FiveDaysForeCast: Decodable {
    let dt: Double?
    let date: String?
    let weather: [Weather]?
    let mainDetails: MainDetails?
    let wind: Wind?
    var rain: Rain?
    let cloud: Cloud?
    
    private enum CodingKeys: String, CodingKey {
        case date = "dt_txt"
        case weather = "weather"
        case mainDetails = "main"
        case wind = "wind"
        case rain = "rain"
        case dt = "dt"
        case cloud  = "clouds"
    }
}
