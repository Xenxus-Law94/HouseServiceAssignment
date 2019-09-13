//
//  Route.swift
//  House Service App
//
//  Created by tunlukhant on 9/13/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func navigatetoTIDetail(HouseDetails: HouseVO) {
        let storyBoard = UIStoryboard(name: ShareConstants.StoryBoards.SB_Main, bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: HouseDetailsViewController.identifier) as? HouseDetailsViewController
        vc?.houseDetails = HouseDetails
        if let viewcontroller = vc{
            self.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
}
