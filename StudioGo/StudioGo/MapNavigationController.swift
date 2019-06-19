//
//  MapNavigationController.swift
//  StudioGo
//
//  Created by Owner on 2/9/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit
import FontAwesome_swift

class MapNavigationController: UINavigationController {

    private let _screenWidth = GlobalConstants.screenWidth
    private let _screenHeight = GlobalConstants.screenHeight
    
    private let mediumFont:UIFont = GlobalConstants.mediumFont
    private let regularFont:UIFont = GlobalConstants.regularFont
    private let lightFont:UIFont = GlobalConstants.lightFont
    
    private let studioYellow = GlobalConstants.studioYellow
    
    let navBarObj = NavBarView()
    var navBar = UIView()
    
    let postOptionsObj = PostOptionsView()
    var postOptionsView = UIView()
    
    let iconSize = CGSize.init(width: 54, height: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
        
        postOptionsView = postOptionsObj.setupOptions(navController: self, addLocationAction: #selector(pushAddLocationVC), portfolioPost: #selector(pushAddLocationVC))
        self.view.addSubview(postOptionsView)
                
//        navBarColour()
        
        navBar = navBarObj.createView(target: self, leftButtonAction: #selector(self.pushProfile), rightButtonAction: #selector(self.showOptions))

        self.view.addSubview(navBar)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func pushProfile() {
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.moveIn
//        transition.subtype = CATransitionSubtype.fromBottom
//        view.layer.add(transition, forKey: nil)
        pushViewController(ProfileViewController(), animated: false)
//
//        navBar.removeFromSuperview()
//        let leftBtn = navBarObj.createLeftButton(title: String.fontAwesomeIcon(name: .user))
//        leftBtn.addTarget(self, action: #selector(popController), for: UIControl.Event.touchUpInside)
//        let rightBtn = navBarObj.createRightButton(title: String.fontAwesomeIcon(name: .edit))
//        rightBtn.addTarget(self, action: #selector(popController), for: UIControl.Event.touchUpInside)
//        navBar = navBarObj.createView(leftButton: userBtn, rightButton: editBtn)
//        self.view.addSubview(navBar)
    }
    
    @objc func showOptions() {
        postOptionsView = postOptionsObj.showOptions()
        navBar = navBarObj.updateTargets(target: self, leftButtonAction: #selector(popController), rightButtonAction: #selector(hideOptions))
    }
    
    @objc func hideOptions() {
        postOptionsView = postOptionsObj.hideOptions()
        navBar = navBarObj.updateTargets(target: self, leftButtonAction: #selector(popController), rightButtonAction: #selector(showOptions))
    }
    
    @objc func popController() {
        self.popViewController(animated: true)
    }
    
    func navBarColour() {
        self.navigationBar.barTintColor = studioYellow
        self.navigationBar.backgroundColor = studioYellow
        self.navigationBar.isTranslucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func pushAddLocationVC() {
        print("PUSHED")
        hideOptions()
        self.pushViewController(AddLocationViewController(), animated: false)
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
