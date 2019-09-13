//
//  HouseVO.swift
//  House Service App
//
//  Created by tunlukhant on 9/11/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import Foundation

struct HouseVO: Codable {
    var id: Int?
//    var houseImageUrl: String?
    var house_image_url: String?
    var name: String?
    var description: String?
    var price: Double?
    var address: String?
//    var squareFeet: Double?
    var square_feet: Double?
    var latitude: Double?
    var longitude: Double?
}
