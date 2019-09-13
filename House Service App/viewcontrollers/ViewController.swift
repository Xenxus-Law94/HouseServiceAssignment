//
//  ViewController.swift
//  House Service App
//
//  Created by tunlukhant on 9/11/19.
//  Copyright © 2019 tunlukhant. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: BaseViewController {

    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var viewCollection: UIView!
    @IBOutlet weak var viewNear: UIView!
    @IBOutlet weak var viewPrice: UIView!
    @IBOutlet weak var lblTopCollection: UILabel!
    @IBOutlet weak var lblNearme: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var tbViewHouse: UITableView!
    
    var refreshControl = UIRefreshControl()
    
    var houseServiceResponse: HouseServiceResponse = HouseServiceResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSearch.layer.cornerRadius = 10
        getHouseList()
        
        let TopGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTopBar))
        let NearGesture = UITapGestureRecognizer(target: self, action: #selector(onClickNearBar))
        let PriceGesture = UITapGestureRecognizer(target: self, action: #selector(onClickPriceBar))
        viewCollection.isUserInteractionEnabled = true
        viewCollection.addGestureRecognizer(TopGesture)
        viewNear.isUserInteractionEnabled = true
        viewNear.addGestureRecognizer(NearGesture)
        viewPrice.isUserInteractionEnabled = true
        viewPrice.addGestureRecognizer(PriceGesture)
        
        tbViewHouse.register(UINib(nibName: HouseServiceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HouseServiceTableViewCell.identifier)
        tbViewHouse.dataSource = self
        tbViewHouse.contentInset = UIEdgeInsets(top: 2, left: 0, bottom: 22, right: 0)
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tbViewHouse.addSubview(refreshControl)
        tbViewHouse.separatorStyle = .none
    }
    
    @objc func onRefresh() {
        getHouseList()
    }

    
    @objc func onClickTopBar() {
        
        lblTopCollection.font = UIFont(name:"AvenirNext-DemiBold", size: 18.0)
        lblTopCollection.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lblNearme.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        lblNearme.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        lblPrice.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        lblPrice.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    @objc func onClickNearBar() {
        lblTopCollection.font = UIFont(name:"AvenirNext-Regular", size: 16.0)
        lblTopCollection.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        lblNearme.font = UIFont(name: "AvenirNext-DemiBold", size: 18.0)
        lblNearme.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lblPrice.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        lblPrice.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    @objc func onClickPriceBar() {
        lblTopCollection.font = UIFont(name:"AvenirNext-Regular", size: 16.0)
        lblTopCollection.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        lblNearme.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        lblNearme.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        lblPrice.font = UIFont(name: "AvenirNext-DemiBold", size: 18.0)
        lblPrice.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private func getHouseList() {
        self.showProgress(message: "Loading....")
        HouseServiceModel.shared().apiGetHouseList(success: {
            self.hideProgress()
            self.refreshControl.endRefreshing()
            self.tbViewHouse.reloadData()
        }) { (err) in
            self.hideProgress()
            self.refreshControl.endRefreshing()
            print(err)
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HouseServiceTableViewCell.identifier, for: indexPath) as! HouseServiceTableViewCell
        cell.house = HouseServiceModel.shared().houseServiceResponse.data?[indexPath.row] ?? HouseVO()
        cell.delegate = self
        return cell
        
    }
    
    
}

extension ViewController: HouseListItemActionDelegate {
    func onClickDetails(houseDetails: HouseVO?) {
        let storyBoard = UIStoryboard(name: ShareConstants.StoryBoards.SB_Main, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: HouseDetailsViewController.identifier) as? HouseDetailsViewController
        //print("Here is in ViewController \(houseDetails.name)")
        vc?.houseDetails = houseDetails
        
        if let viewcontroller = vc{
            self.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
    
    
}

