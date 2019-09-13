//
//  HouseDetailsViewController.swift
//  House Service App
//
//  Created by tunlukhant on 9/12/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import UIKit

class HouseDetailsViewController: UIViewController {

    @IBOutlet weak var ivSecFlag: UIImageView!
    @IBOutlet weak var viewAddFravoite: UIView!
    @IBOutlet weak var viewBookNow: UIView!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSquarefeet: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var viewLocation: UIView!
    @IBOutlet weak var lblTitil: UILabel!
    @IBOutlet weak var viewSeephotos: UIView!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var viewSeeReview: UIView!
    @IBOutlet weak var ivLocation: UIImageView!
    @IBOutlet weak var ivSquare: UIImageView!
    @IBOutlet weak var ivLike: UIImageView!
    @IBOutlet weak var ivBed: UIImageView!
    @IBOutlet weak var ivFlag: UIImageView!
    static let identifier = "HouseDetailsViewController"
    var houseDetails: HouseVO!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSearch.layer.cornerRadius = 10
        viewLocation.layer.cornerRadius = viewLocation.frame.height/2
        viewLocation.layer.masksToBounds = false
        viewLocation.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewLocation.layer.shadowOffset = CGSize(width:  0, height: 3)
        viewLocation.layer.shadowOpacity = 0.5
        viewSeeReview.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        viewSeeReview.layer.cornerRadius = 10
        viewSeephotos.layer.cornerRadius = 10
        viewSeephotos.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewSeephotos.layer.borderWidth = 1
        viewBookNow.layer.cornerRadius = 10
        viewAddFravoite.layer.cornerRadius = 10
        //viewAddfavorite
        ivLocation.tintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        ivSquare.tintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        ivLike.tintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        ivBed.tintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        ivFlag.tintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        ivSecFlag.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        lblPrice.text = houseDetails.price?.description
        lblAddress.text = houseDetails.address
        lblSquarefeet.text = houseDetails.square_feet?.description
        lblTitil.text = houseDetails.name
        lblDescription.text = houseDetails.description
        let houseImage = houseDetails.house_image_url
        ivImage.sd_setImage(with: URL(string: houseImage ?? ""), placeholderImage: UIImage(named: "placeholder"))
        
    }

}
