//
//  AddLocationViewController.swift
//  StudioGo
//
//  Created by Owner on 6/5/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {
    
    let addLocationViewObj = AddLocationView()
    var addLocationView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        addLocationView = self.addLocationViewObj.setupView()
        
        self.view = addLocationView

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
