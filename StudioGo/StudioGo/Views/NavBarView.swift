//
//  NavBarView.swift
//  StudioGo
//
//  Created by Owner on 2/18/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class NavBarView: UIView {

    private let _screenWidth = GlobalConstants.screenWidth
    private let _screenHeight = GlobalConstants.screenHeight
    
    private let studioYellow = GlobalConstants.studioYellow
    
    let iconSize = CGSize.init(width: 54, height: 50)
    
    var leftButton = UIButton()
    var rightButton = UIButton()
    
    func createLeftButton(title: String?) -> UIButton {
        let leftButton = UIButton.init(frame: CGRect.init(x: 10, y: 12, width: 60, height: 60))
//        leftButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 28, style: .regular)
//        leftButton.setTitle(title, for: .normal)
        leftButton.setImage(UIImage.init(named: "profileIcon"), for: .normal)
        return leftButton
    }
    
    func createRightButton(title: String?) -> UIButton {
        let rightButton = UIButton.init(frame: CGRect.init(x: _screenWidth - 22-32, y: 28, width: 32, height: 32))
        rightButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 28, style: .regular)
        rightButton.setTitle(title, for: .normal)
        return rightButton
    }
    
//    @objc func showOptions() {
//        MapNavigationController().showOptions()
//    }
//
//    @objc func hideOptions() {
//        MapNavigationController().hideOptions()
//    }
//
//    @objc func pushProfile() {
//        MapNavigationController().pushProfile()
//    }
    
    func createView(target: UIViewController, leftButtonAction: Selector, rightButtonAction: Selector, logoAction: Selector) -> UIView {
        self.frame = CGRect.init(x: 0, y: 0, width: _screenWidth, height: 72)
        self.backgroundColor = studioYellow
        self.isHidden = false
        self.tintColor = studioYellow

        self.leftButton = createLeftButton(title: String.fontAwesomeIcon(name: .user))
        self.rightButton = createRightButton(title: String.fontAwesomeIcon(name: .edit))
        leftButton.addTarget(target, action: leftButtonAction, for: UIControl.Event.touchUpInside)
        rightButton.addTarget(target, action: rightButtonAction, for: UIControl.Event.touchUpInside)
        self.addSubview(leftButton)
        self.addSubview(rightButton)
        
        let logo = UIImage.init(named: "StudioGoLogoNavBar")
        let logoContainer = UIImageView.init(frame: CGRect.init(x: (_screenWidth/2)-50, y: 34, width: 100, height: 18))
        logoContainer.image = logo
        let logoButton = UIButton.init(frame: CGRect.init(x: (_screenWidth/2)-50, y: 34, width: 100, height: 18))
        logoButton.setImage(logo, for: .normal)
        logoButton.addTarget(nil, action: logoAction, for: .allEvents)
        self.addSubview(logoButton)

        return self
    }

    func updateTargets(target: UIViewController, leftButtonAction: Selector, rightButtonAction: Selector) -> UIView {
        leftButton.removeTarget(nil, action: nil, for: .allEvents)
        rightButton.removeTarget(nil, action: nil, for: .allEvents)
        leftButton.addTarget(target, action: leftButtonAction, for: UIControl.Event.touchUpInside)
        rightButton.addTarget(target, action: rightButtonAction, for: UIControl.Event.touchUpInside)
        
        return self
    }
    
    func resetButtonView() {
        leftButton.setTitleColor(.white, for: .normal)
        rightButton.setTitleColor(.white, for: .normal)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
