//
//  AddLocationViewController.swift
//  StudioGo
//
//  Created by Owner on 6/5/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit
import SwiftyJSON

class AddLocationViewController: UIViewController {
    
    let addLocationViewObj = AddLocationView()
    var addLocationView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        addLocationView = self.addLocationViewObj.setupView()
        
        self.view = addLocationView

        NotificationCenter.default.addObserver(self, selector: #selector(submitButtonClicked), name: NSNotification.Name(rawValue: "submitLocationNotification"), object: nil)

        // Do any additional setup after loading the view.
    }
    
    @objc func submitButtonClicked(data: NSNotification)
    {
        
        //If any data is passed get it using
        let _:NSDictionary = data.userInfo! as NSDictionary   //If data is of NSDictionary type.

//        print(data.userInfo ?? [])
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addLocationNotification"), object: nil, userInfo: data.userInfo)
        popController()
    }
    
    func popController()
    {
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
