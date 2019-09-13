//
//  BaseViewController.swift
//  House Service App
//
//  Created by tunlukhant on 9/12/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension BaseViewController: NVActivityIndicatorViewable{
    func showProgress(message: String) {
        startAnimating(CGSize(width: 30, height: 30), message: message, messageFont: nil, type: NVActivityIndicatorType.ballPulseRise)
    }
    
    func hideProgress() {
        stopAnimating()
    }
}
