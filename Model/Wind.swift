//
//  Wind.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 24/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import Foundation
struct Wind: Decodable {
    
    let speed: Double?
    let degrees: Double?
    
    private enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
    
}
