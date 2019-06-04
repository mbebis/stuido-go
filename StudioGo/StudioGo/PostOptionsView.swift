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
    
    private let _screenWidth = UIScreen.main.bounds.width
    private let _screenHeight = UIScreen.main.bounds.height
    
    let mediumFont:UIFont = UIFont(name: "Roboto-Medium", size: 20)!
    let regularFont:UIFont = UIFont(name: "Roboto-Regular", size: 14)!
    let lightFont:UIFont = UIFont(name: "Roboto-Light", size: 12)!
    
    let studioYellow = UIColor.init(red: 237/255, green: 200/255, blue: 39/255, alpha: 1)
    let studioPink = UIColor.init(red: 240/255, green: 89/255, blue: 153/255, alpha: 1)
    let studioGrey = UIColor.init(red: 70/255, green: 71/255, blue: 73/255, alpha: 1)
    
    let optionsView = UIView()
    let overlay = UIView()
    
    func setupOptions() -> UIView {
                
        let overlayFrame = CGRect.init(x: 0, y: 0, width: _screenWidth, height: _screenHeight)
        overlay.frame = overlayFrame
        let overlayBtn = UIButton(frame: overlayFrame)
        overlay.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0)
        overlay.addSubview(overlayBtn)
        self.addSubview(overlay)
        
        let buttonWidth: CGFloat = Screen.width*(2/3)
        let buttonHeight: CGFloat = 36
        let buttonSpacing: CGFloat = 12
        
        //        let optionsViewFrame = CGRect.init(x: _screenWidth/2-buttonWidth/2, y: 500, width: buttonWidth, height: buttonHeight*2+buttonSpacing)
        let optionsViewFrame = CGRect.init(x: _screenWidth/2-buttonWidth/2, y: _screenHeight, width: buttonWidth, height: buttonHeight*2+buttonSpacing)
        optionsView.frame = optionsViewFrame
        
        let addLocationBtn = optionButton(text: "ADD LOCATION", y: 0, width: buttonWidth, height: buttonHeight)
        optionsView.addSubview(addLocationBtn)
        let createPostBtn = optionButton(text: "PORTFOLIO POST", y: (optionsView.subviews.last?.frame.maxY)!+buttonSpacing, width: buttonWidth, height: buttonHeight)
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
        
        return btn
    }
    
    func optionButton(text: String, y: CGFloat, width: CGFloat, height: CGFloat) -> UIButton {
        let buttonCornerRadius: CGFloat = height/2
        
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: y, width:  width, height: height))
        btn.backgroundColor = .white
        btn.layer.cornerRadius = buttonCornerRadius
        btn.setTitle(text, for: UIControl.State.normal)
        btn.setTitleColor(studioYellow, for: .normal)
        btn.titleLabel!.font = regularFont
        //        btn.titleLabel?.text = text
        return btn
    }
    
    @objc func showOptions() -> UIView {
        let buttonWidth: CGFloat = Screen.width*(2/3)
        let buttonHeight: CGFloat = 36
        let buttonSpacing: CGFloat = 12
        
        let optionsViewFrame = CGRect.init(x: _screenWidth/2-buttonWidth/2, y: 500, width: buttonWidth, height: buttonHeight*2+buttonSpacing)
        optionsView.frame = optionsViewFrame
        overlay.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        return self
    }
    
    @objc func hideOptions() -> UIView {
        let buttonWidth: CGFloat = Screen.width*(2/3)
        let buttonHeight: CGFloat = 36
        let buttonSpacing: CGFloat = 12
        
        let optionsViewFrame = CGRect.init(x: _screenWidth/2-buttonWidth/2, y: _screenHeight, width: buttonWidth, height: buttonHeight*2+buttonSpacing)
        optionsView.frame = optionsViewFrame
        overlay.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0)
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
