//
//  LocationViewController.swift
//  
//
//  Created by Owner on 4/8/19.
//

import UIKit
import FontAwesome_swift
import SwiftyJSON

class LocationViewController: UIViewController {

    let locationsModel = MapModelController.shared
    
    var initLocation:Location? = nil
    
    let LocationViewObj = LocationView()
    
    let dumbyLocation = Location.init(accessibility: "nil", city: "nil", cost: "nil", country: "nil", description: "nil", equipment: "nil", hasPermit: false, images: [], isPrivate: false, locationTitle: "nil", postalCode: "nil", province: "nil", spaceType: "nil", streetAddress: "nil")
    
    override func viewWillAppear(_ animated: Bool) {
        print("pre")
        prepare()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showMoreInfoNotif), name: NSNotification.Name(rawValue: "showMoreInfo"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(pushSpaceTypeVC), name: NSNotification.Name(rawValue: "pushSpaceTypeVC"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(pushAccessibilityTypesVC), name: NSNotification.Name(rawValue: "pushAccessibilityTypesVC"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(pushEquipmentListVC), name: NSNotification.Name(rawValue: "pushEquipmentListVC"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(pushPermitTypeVC), name: NSNotification.Name(rawValue: "pushPermitTypeVC"), object: nil)
        print(initLocation!)
        self.view = LocationViewObj.createView(location: initLocation ?? dumbyLocation)

        // Do any additional setup after loading the view.
    }
    
    func prepare() {
//        NotificationCenter.default.addObserver(self, selector: #selector(showMoreInfoNotif), name: NSNotification.Name(rawValue: "showMoreInfo"), object: nil)
    }
    
    @objc func showMoreInfoNotif(data: NSNotification)
    {
        
        //If any data is passed get it using
        let receivedData:NSDictionary = data.userInfo! as NSDictionary   //If data is of NSDictionary type.
        print("Mafde it")
//        print(locationsModel.getLocations())
        
        let json: JSON = JSON(receivedData)
        
        let jsonObj = json
        print("LT: ", jsonObj["locationTitle"].stringValue)
        let sentLocation = jsonObj["locationTitle"].stringValue.lowercased()
//            .split(separator: " ", maxSplits: 1, omittingEmptySubsequences: true)[1]
        
        let locationRetrieved = locationsModel.getLocationByTitle(title: sentLocation)
        if (locationRetrieved != nil) {
            if (!self.isViewLoaded)
            {
                viewDidLoad()
            }
            LocationViewObj.populateView(location: locationRetrieved!)
        } else {
            LocationViewObj.populateView(location: dumbyLocation)
        }
        
    }
    
    @objc func pushSpaceTypeVC() {
        self.navigationController?.pushViewController(SpaceTypeViewController(), animated: true)
    }
    
    @objc func pushAccessibilityTypesVC() {
        self.navigationController?.pushViewController(AccessibilityTypesViewController(), animated: true)
    }
    
    @objc func pushEquipmentListVC() {
        self.navigationController?.pushViewController(EquipmentListViewController(), animated: true)
    }
    
    @objc func pushPermitTypeVC() {
        self.navigationController?.pushViewController(PermitTypeViewController(), animated: true)
    }
    
    
}
