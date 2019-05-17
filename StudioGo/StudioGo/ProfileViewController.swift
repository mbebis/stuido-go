//
//  ProfileViewController.swift
//  StudioGo
//
//  Created by Owner on 2/12/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let studioYellowLight = UIColor.init(red: 254/255, green: 232/255, blue: 13/255, alpha: 1)
    let studioYellowDark = UIColor.init(red: 237/255, green: 196/255, blue: 41/255, alpha: 1)
    let studioYellow = UIColor.init(red: 237/255, green: 200/255, blue: 39/255, alpha: 1)
    let studioPink = UIColor.init(red: 240/255, green: 89/255, blue: 153/255, alpha: 1)
    
    let iconSize = CGSize.init(width: 54, height: 50)
    
    let attributes = [NSAttributedString.Key.font: UIFont.fontAwesome(ofSize: 20, style: .regular)]
    let attributes2 = [NSAttributedString.Key.font: UIFont.fontAwesome(ofSize: 20, style: .regular)]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

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
