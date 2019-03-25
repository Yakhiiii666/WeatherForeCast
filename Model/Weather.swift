//
//  Weather.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 24/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import Foundation
struct Weather: Decodable {
    let main: String?
    let description: String?
    let id: Double?
    let icon: String?
}

