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
    private let studioPink = GlobalConstants.studioPink
    
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
        
        navBar = navBarObj.createView(target: self, leftButtonAction: #selector(pushProfile), rightButtonAction: #selector(self.showOptions), logoAction: #selector(popToRoot))
        self.view.addSubview(navBar)
        
        NotificationCenter.default.addObserver(self, selector: #selector(submitLocationBtnClicked), name: NSNotification.Name(rawValue: "submitLocationNotification"), object: nil)
        
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
    
    @objc func showOptions(sender:UIButton) {
        sender.setTitleColor(studioPink, for: .normal)
        postOptionsView = postOptionsObj.showOptions()
        navBar = navBarObj.updateTargets(target: self, leftButtonAction: #selector(pushProfile), rightButtonAction: #selector(hideOptions))
    }
    
    @objc func hideOptions(sender:UIButton) {
        sender.setTitleColor(.white, for: .normal)
        postOptionsView = postOptionsObj.hideOptions()
        navBar = navBarObj.updateTargets(target: self, leftButtonAction: #selector(pushProfile), rightButtonAction: #selector(showOptions))
    }
    
    @objc func popController() {
        self.popViewController(animated: true)
    }
    
    @objc func popToMap(sender:UIButton) {
        hideOptions(sender: sender)
        popController()
    }
    
    @objc func submitLocationBtnClicked() {
        navBar = navBarObj.updateTargets(target: self, leftButtonAction: #selector(pushProfile), rightButtonAction: #selector(showOptions))
        navBarObj.resetButtonView()
        popController()
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
    
    @objc func pushAddLocationVC(sender: UIButton) {
        hideOptions(sender: sender)
        navBar = navBarObj.updateTargets(target: self, leftButtonAction: #selector(pushProfile), rightButtonAction: #selector(popToMap))
        self.pushViewController(AddLocationViewController(), animated: false)
    }
    
    @objc func popToRoot() {
        self.popToRootViewController(animated: true)
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
