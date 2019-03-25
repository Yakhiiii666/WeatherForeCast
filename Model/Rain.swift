//
//  Rain.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 24/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import Foundation
struct Rain: Decodable {
    let rain: Double?
    private enum CodingKeys: String, CodingKey {
        case rain = "3h"
    }
}
