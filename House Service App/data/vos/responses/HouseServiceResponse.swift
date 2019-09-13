//
//  HouseService.swift
//  House Service App
//
//  Created by tunlukhant on 9/11/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import Foundation

struct HouseServiceResponse: Codable {
    var code: Int?
    var message: String?
    var data: [HouseVO]?
}
