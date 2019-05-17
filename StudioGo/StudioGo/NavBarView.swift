//
//  NavBarView.swift
//  StudioGo
//
//  Created by Owner on 2/18/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class NavBarView: UIView {

    private let _screenWidth = UIScreen.main.bounds.width
    private let _screenHeight = UIScreen.main.bounds.height
    
    let studioYellowLight = UIColor.init(red: 254/255, green: 232/255, blue: 13/255, alpha: 1)
    let studioYellowDark = UIColor.init(red: 237/255, green: 196/255, blue: 41/255, alpha: 1)
    let studioYellow = UIColor.init(red: 237/255, green: 200/255, blue: 39/255, alpha: 1)
    let studioPink = UIColor.init(red: 240/255, green: 89/255, blue: 153/255, alpha: 1)
    
    let iconSize = CGSize.init(width: 54, height: 50)
    
    func createLeftButton(title: String?) -> UIButton {
        let leftButton = UIButton.init(frame: CGRect.init(x: 22, y: 28, width: 32, height: 32))
        leftButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 28, style: .regular)
        leftButton.setTitle(title, for: .normal)
        return leftButton
    }
    
    func createRightButton(title: String?) -> UIButton {
        let rightButton = UIButton.init(frame: CGRect.init(x: _screenWidth - 22-32, y: 28, width: 32, height: 32))
        rightButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 28, style: .regular)
        rightButton.setTitle(title, for: .normal)
        return rightButton
    }
    
    
    func createView(leftButton: UIButton, rightButton: UIButton) -> UIView {
        self.frame = CGRect.init(x: 0, y: 0, width: _screenWidth, height: 72)
        self.backgroundColor = studioYellow
        self.isHidden = false
        self.tintColor = studioYellow

        self.addSubview(leftButton)
        self.addSubview(rightButton)
        
        let logo = UIImage.init(named: "StudioGoLogoNavBar")
        let logoContainer = UIImageView.init(frame: CGRect.init(x: (_screenWidth/2)-25, y: 20, width: 50, height: 50))
        logoContainer.image = logo
        self.addSubview(logoContainer)
        
        return self
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
