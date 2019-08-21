//
//  ProfileViewController.swift
//  StudioGo
//
//  Created by Owner on 2/12/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let ProfileViewObj = ProfileView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(popController), name: NSNotification.Name(rawValue: "popProfileController"), object: nil)
        
        self.view = ProfileViewObj.createView()

//not implemented
        // Do any additional setup after loading the view.
    }
    
    @objc func popController() {
        self.navigationController?.popViewController(animated: true)
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
