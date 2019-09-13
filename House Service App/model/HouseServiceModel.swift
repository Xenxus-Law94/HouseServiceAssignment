//
//  HouseServiceModel.swift
//  House Service App
//
//  Created by tunlukhant on 9/11/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import Foundation

class HouseServiceModel {
    
    class func shared() -> HouseServiceModel {
        return sharedHouseServiceModel
    }
    
    private static var sharedHouseServiceModel: HouseServiceModel = {
        let houseModel = HouseServiceModel()
        return houseModel
    }()
    
    var houseServiceResponse: HouseServiceResponse = HouseServiceResponse()
    
    func apiGetHouseList(success: @escaping () -> Void,
                         failure: @escaping (String) -> Void) {
        NetworkClient.shared().getData(success: { (data) in
            guard let data = data as? Data else {return}
            do {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.houseServiceResponse = try
                    decoder.decode(HouseServiceResponse.self, from: data)
                success()
            } catch let jsonErr {
                failure(jsonErr.localizedDescription)
            }
        }) { (error) in
            failure(error)
        }
    }
}
