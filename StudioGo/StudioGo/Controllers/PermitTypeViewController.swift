//
//  PermitTypeViewController.swift
//  StudioGo
//
//  Created by Owner on 8/16/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class PermitTypeViewController: UIViewController {

    let PermitTypeViewObj = PermitType()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = PermitTypeViewObj.createView()

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
