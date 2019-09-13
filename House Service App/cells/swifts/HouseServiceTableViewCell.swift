//
//  HouseServiceTableViewCell.swift
//  House Service App
//
//  Created by tunlukhant on 9/11/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import UIKit
import SDWebImage

class HouseServiceTableViewCell: UITableViewCell {

    var delegate : HouseListItemActionDelegate?
    static let identifier = "HouseServiceTableViewCell"
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var ivHouse: UIImageView!
    @IBOutlet weak var lblBed: UILabel!
    @IBOutlet weak var lblSquarefeet: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var viewHotel: CardView!
    @IBOutlet weak var btnDetails: CardView!
    @IBOutlet weak var lblPrice: UIView!
    @IBOutlet weak var ivLocation: UIImageView!
    @IBOutlet weak var ivSquareFeet: UIImageView!
    @IBOutlet weak var ivBed: UIImageView!
    @IBOutlet weak var ivFlage: UIImageView!
    
    var house: HouseVO? {
        didSet {
            if let house = house {
                let houseImage = house.house_image_url
                ivHouse.sd_setImage(with: URL(string: houseImage ?? ""), placeholderImage: UIImage(named: "placeholder"))
                lblAmount.text = house.price?.description
                lblLocation.text = house.address
                lblSquarefeet.text = house.square_feet?.description
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        lblPrice.layer.masksToBounds = true
        lblPrice.layer.cornerRadius = 10
        btnDetails.layer.cornerRadius = btnDetails.frame.height/2
        btnDetails.layer.masksToBounds = false
        btnDetails.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btnDetails.layer.shadowOffset = CGSize(width:  0, height: 3)
        btnDetails.layer.shadowOpacity = 0.5
        viewImage.layer.cornerRadius = 10
        ivHouse.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        ivHouse.layer.cornerRadius = 10
        ivLocation.tintColor = #colorLiteral(red: 0.6729137301, green: 0.2982863784, blue: 0.1597679853, alpha: 1)
        ivBed.tintColor = #colorLiteral(red: 0.6729137301, green: 0.2982863784, blue: 0.1597679853, alpha: 1)
        ivSquareFeet.tintColor = #colorLiteral(red: 0.6729137301, green: 0.2982863784, blue: 0.1597679853, alpha: 1)
        ivFlage.tintColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        DetailGestureRecongnier()
    }
    
    func DetailGestureRecongnier() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickViewDetails))
        btnDetails.isUserInteractionEnabled = true
        btnDetails.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func onClickViewDetails() {
//        print("Here is in ViewController \(house?.name)")
        let houseDetails: HouseVO? = house
        delegate?.onClickDetails(houseDetails: houseDetails)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    
}
