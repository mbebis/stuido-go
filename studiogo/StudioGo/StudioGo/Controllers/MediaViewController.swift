//
//  MediaViewController.swift
//  StudioGo
//
//  Created by Owner on 1/30/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class MediaViewController: UIViewController {

    let MediaViewObj = MediaView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = MediaViewObj.createView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
