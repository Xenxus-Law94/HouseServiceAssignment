//
//  NetworkClient.swift
//  House Service App
//
//  Created by tunlukhant on 9/11/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import Foundation
import Alamofire

class NetworkClient {
    private let baseUrl: String
    
    private init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    private static var sharedNetworkClient: NetworkClient = {
        let url = ShareConstants.BASE_URL
        return NetworkClient.init(baseUrl: url)
    }()
    
    class func shared() -> NetworkClient {
        return sharedNetworkClient
    }
    
    public func getData(success: @escaping (Any) -> Void,
                        failure: @escaping (String) -> Void) {
        Alamofire.request(baseUrl).responseData { (responsedata) in
            switch responsedata.result {
            case .success:
                guard let data = responsedata.result.value else {return}
                success(data)
                break
            case .failure(let err):
                failure(err.localizedDescription)
                break
            }
        }
    }
}
