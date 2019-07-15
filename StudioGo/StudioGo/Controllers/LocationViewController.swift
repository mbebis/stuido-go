//
//  LocationViewController.swift
//  
//
//  Created by Owner on 4/8/19.
//

import UIKit
import FontAwesome_swift

class LocationViewController: UIViewController {

    let LocationViewObj = LocationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = LocationViewObj.createView()

        // Do any additional setup after loading the view.
    }
    
}
