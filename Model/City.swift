//
//  City.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 24/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import Foundation
struct City: Decodable {
    let id: Double?
    let name: String?
    let coord: Coord?
    let country: String?
}

