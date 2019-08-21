//
//  PostOptionsView.swift
//  StudioGo
//
//  Created by Owner on 5/29/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit
import FontAwesome_swift

class PostOptionsView: UIView {
    
    private let _screenWidth = GlobalConstants.screenWidth
    private let _screenHeight = GlobalConstants.screenHeight
    
    private let mediumFont:UIFont = GlobalConstants.mediumFont
    private let regularFont:UIFont = GlobalConstants.regularFont
    private let lightFont:UIFont = GlobalConstants.lightFont
    
    private let studioYellow = GlobalConstants.studioYellow
    
    let optionsView = UIView()
    let overlay = UIView()
    
    func setupOptions(navController: UINavigationController, addLocationAction: Selector, portfolioPost: Selector) -> UIView {
        
        let frame = CGRect.init(x: 0, y: 0, width: 0, height: 0)
        self.frame = frame
        
        let overlayFrame = CGRect.init(x: 0, y: 0, width: _screenWidth, height: _screenHeight)
        overlay.frame = overlayFrame
        let overlayBtn = UIButton(frame: overlayFrame)
        overlayBtn.addTarget(self, action: #selector(hideOptions), for: .touchUpInside)
        overlay.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0)
        overlay.addSubview(overlayBtn)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(pushAddLocationVC))
        overlay.addGestureRecognizer(tap)
        
        self.addSubview(overlay)
        
        let buttonWidth: CGFloat = Screen.width*(2/3)
        let buttonHeight: CGFloat = 36
        let buttonSpacing: CGFloat = 12
        
        let optionsViewFrame = CGRect.init(x: _screenWidth/2-buttonWidth/2, y: _screenHeight, width: buttonWidth, height: buttonHeight*2+buttonSpacing)
//        let optionsViewFrame = CGRect.init(x: _screenWidth/2-buttonWidth/2, y: 500, width: buttonWidth, height: (buttonHeight*2)+buttonSpacing)
        optionsView.frame = optionsViewFrame
        
        let addLocationBtn = optionButton(text: "ADD LOCATION", navController: navController, action: addLocationAction, y: 0, width: buttonWidth, height: buttonHeight)
        optionsView.addSubview(addLocationBtn)
        let createPostBtn = tempOptionButton(text: "PORTFOLIO POST", navController: navController, action: addLocationAction, y: (optionsView.subviews.last?.frame.maxY)!+buttonSpacing, width: buttonWidth, height: buttonHeight)
        optionsView.addSubview(createPostBtn)

        self.addSubview(optionsView)
        
        return self
    }
    
    func circleButton(icon: String, x: CGFloat, y: CGFloat, radius: CGFloat, style: FontAwesomeStyle) -> UIButton {
        let buttonCornerRadius: CGFloat = radius/2
        
        let btn = UIButton.init(frame: CGRect.init(x: x-radius/2, y: y, width: radius, height: radius))
        btn.backgroundColor = .red
        btn.layer.cornerRadius = buttonCornerRadius
        btn.titleLabel?.font = UIFont.fontAwesome(ofSize: btn.frame.width-8, style: style)
        btn.setTitle(icon, for: UIControl.State.normal)
        btn.setTitleColor(.white, for: .normal)
        btn.isUserInteractionEnabled = true
        
        return btn
    }
    
    func optionButton(text: String, navController: UINavigationController, action: Selector, y: CGFloat, width: CGFloat, height: CGFloat) -> UIButton {
        let buttonCornerRadius: CGFloat = height/2
        
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: y, width: width, height: height))
        btn.backgroundColor = .white
        btn.layer.cornerRadius = buttonCornerRadius
        
        let attributedTitle = NSAttributedString(string: text, attributes: (GlobalConstants.yellowTextAttributes as! [NSAttributedString.Key : Any]))
        btn.setAttributedTitle(attributedTitle, for: .normal)
        //        btn.setTitle(text, for: UIControl.State.normal)
        //        btn.setTitleColor(studioYellow, for: .normal)
        //        btn.titleLabel!.font = regularFont
        
        //        btn.addTarget(navController, action: action, for: UIControl.Event.touchUpInside)
        btn.addTarget(navController, action: action, for: UIControl.Event.touchUpInside)
        
        return btn
    }
    
    func tempOptionButton(text: String, navController: UINavigationController, action: Selector, y: CGFloat, width: CGFloat, height: CGFloat) -> UIButton {
        let buttonCornerRadius: CGFloat = height/2
        
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: y, width: width, height: height))
        btn.backgroundColor = .white
        btn.layer.opacity = 0.5
        btn.layer.cornerRadius = buttonCornerRadius
        
        let attributedTitle = NSAttributedString(string: text, attributes: (GlobalConstants.greyTextRegularAttr as! [NSAttributedString.Key : Any]))
        btn.setAttributedTitle(attributedTitle, for: .normal)
        //        btn.setTitle(text, for: UIControl.State.normal)
        //        btn.setTitleColor(studioYellow, for: .normal)
        //        btn.titleLabel!.font = regularFont
        
        //        btn.addTarget(navController, action: action, for: UIControl.Event.touchUpInside)
        btn.addTarget(navController, action: action, for: UIControl.Event.touchUpInside)
        
        return btn
    }
    
    @objc func showOptions() -> UIView {
        let buttonWidth: CGFloat = Screen.width*(2/3)
        let buttonHeight: CGFloat = 36
        let buttonSpacing: CGFloat = 12
        UIView.animate(withDuration: 0.2, animations: {
            let optionsViewFrame = CGRect.init(x: self._screenWidth/2-buttonWidth/2, y: self._screenHeight - 170, width: buttonWidth, height: buttonHeight*2+buttonSpacing)
            self.optionsView.frame = optionsViewFrame
            self.overlay.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
            let frame = CGRect.init(x: 0, y: 0, width: self._screenWidth, height: self._screenHeight)
            self.frame = frame
        })
        return self
    }
    
    @objc func hideOptions() -> UIView {
        let buttonWidth: CGFloat = Screen.width*(2/3)
        let buttonHeight: CGFloat = 36
        let buttonSpacing: CGFloat = 12
        
        UIView.animate(withDuration: 0.2, animations: {
            let optionsViewFrame = CGRect.init(x: self._screenWidth/2-buttonWidth/2, y: self._screenHeight, width: buttonWidth, height: buttonHeight*2+buttonSpacing)
            self.optionsView.frame = optionsViewFrame
            self.overlay.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0)
            let frame = CGRect.init(x: 0, y: 0, width: 0, height: 0)
            self.frame = frame
        })
        return self
    }
    
    @objc func pushAddLocationVC() {
        print("WORKING")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
