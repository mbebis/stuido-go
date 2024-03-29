//
//  DropDownView.swift
//  StudioGo
//
//  Created by Owner on 6/13/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class DropDownView: UIView {
    
    var items: [String] = []
    
    private let _screenWidth = GlobalConstants.screenWidth
    private let _screenHeight = GlobalConstants.screenHeight

    private let mediumFont:UIFont = GlobalConstants.mediumFont
    private let regularFont:UIFont = GlobalConstants.regularFont
    private let lightFont:UIFont = GlobalConstants.lightFont
    
    private let studioGrey = GlobalConstants.studioGrey
    private let studioYellow = GlobalConstants.studioYellow
    private let studioLightGrey = GlobalConstants.studioLightGrey
    
    let padding:CGFloat = 10
    let sidePadding:CGFloat = 14
    let extraPadding:CGFloat = 5
    let singleLineHeight:CGFloat = 32
    
    var textField = UITextField()
    let tableContainer = UIView()
    var tableView = UITableView()
    
    var btnField = UIButton()
    let yesNoContainer = UIView()
    var optionsBtns:[UIButton]
    
    var addIcon: Int = 0
//    var yesBtn = UIButton()
//    var noBtn = UIButton()
    
    init(items: [String], addIcon:Int) {
        self.items = items
        self.addIcon = addIcon
        self.optionsBtns = Array.init(repeating: UIButton(), count: self.items.count-1)
        super.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createDropDownView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIView {
        self.frame = CGRect.init(x: x, y: y+padding, width: width, height: height)
        buttonField()
        dropDownView()
        self.addSubview(yesNoContainer)
        self.addSubview(btnField)
        
        return self
    }
    
    func buttonField() {
        
        btnField.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        btnField.backgroundColor = studioLightGrey
        btnField.layer.cornerRadius = btnField.frame.height/2
        
        let attributedText = NSAttributedString(string: self.items[0], attributes: (GlobalConstants.FieldAddLocationAttributes as! [NSAttributedString.Key : Any]))
        btnField.setAttributedTitle(attributedText, for: .normal)
        
        let rightViewIconView = UIImageView(frame: CGRect.init(x: btnField.frame.maxX - 24, y: btnField.frame.maxY-btnField.frame.height/2-20/2, width: 20, height: 20))
        rightViewIconView.image = UIImage.fontAwesomeIcon(name: .chevronCircleDown, style: .solid, textColor: .white, size: rightViewIconView.bounds.size)
        btnField.addSubview(rightViewIconView)
        btnField.addTarget(self, action: #selector(showDropDownView), for: UIControl.Event.touchUpInside)
        
        if (addIcon == 1) {
            let spaceTypeMoreInfoIcon = addMoreInfoIcon(x: btnField.frame.minX + 6, y: btnField.frame.maxY-btnField.frame.height/2-6, moreInfoPage: #selector(pushSpaceTypeVC))
            btnField.addSubview(spaceTypeMoreInfoIcon)
        }
        
        if (addIcon == 2) {
            let spaceTypeMoreInfoIcon = addMoreInfoIcon(x: btnField.frame.minX + 6, y: btnField.frame.maxY-btnField.frame.height/2-6, moreInfoPage: #selector(pushAccessibilityTypesVC))
            btnField.addSubview(spaceTypeMoreInfoIcon)
        }

        
    }
    
    @objc func pushAccessibilityTypesVC(action: Selector) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushAccessibilityTypesVC"), object: nil)
    }
    
    @objc func pushSpaceTypeVC() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushSpaceTypeVC"), object: nil)
    }
    
    func addMoreInfoIcon(x: CGFloat, y: CGFloat, moreInfoPage: Selector) -> UIButton {
        let moreInfoIconSize:CGFloat = 10
        
        let moreInfoIcon = UIButton(frame: CGRect.init(x: x-moreInfoIconSize/2, y: y-moreInfoIconSize/2, width: moreInfoIconSize*2, height: moreInfoIconSize*2))
        moreInfoIcon.titleLabel?.font = UIFont.fontAwesome(ofSize: moreInfoIconSize, style: .solid)
        moreInfoIcon.setTitle(String.fontAwesomeIcon(name: .questionCircle), for: .normal)
        moreInfoIcon.setTitleColor(studioGrey, for: .normal)
        
        moreInfoIcon.addTarget(self, action: moreInfoPage, for: .touchUpInside)
        
        return moreInfoIcon
    }
    
    func dropDownView() {
        let dropDownY:CGFloat = textField.frame.maxY

        yesNoContainer.frame = CGRect.init(x: 0, y: dropDownY, width: self.frame.width, height: 0)
        yesNoContainer.backgroundColor = .white
        yesNoContainer.clipsToBounds = true
        
        for i in 1...self.items.count-1 {
            optionsBtns[i-1] = dropDownButton(text: self.items[i], y: (i != 1) ? (yesNoContainer.subviews.last!.frame.maxY) : CGFloat.zero)
            yesNoContainer.addSubview(optionsBtns[i-1])
        }
//        yesNoContainer.frame = CGRect.init(x: yesNoContainer.frame.minX, y: yesNoContainer.frame.minY, width: yesNoContainer.frame.width, height: yesNoContainer.subviews.last!.frame.maxY)
//        yesBtn = dropDownButton(text: self.items[1], y: 0)
//        yesNoContainer.addSubview(yesBtn)
//
//        noBtn = dropDownButton(text: self.items[2], y: yesNoContainer.subviews.last!.frame.maxY)
//
//        yesNoContainer.addSubview(noBtn)
    }
    
    func dropDownButton (text: String, y: CGFloat) -> UIButton {
        let btn = UIButton()
        btn.frame = CGRect.init(x: 0, y: y, width: yesNoContainer.frame.width, height: 44)
        btn.backgroundColor = .white
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = regularFont
        btn.tag = tag
        btn.addTarget(self, action: #selector(updateDropDown), for: UIControl.Event.touchUpInside)
        
        return btn
    }
    
    @objc func updateDropDown(sender:UIButton) {
        let text:String = sender.title(for: .normal) ?? "SELECT ONE"
        let attributedText = NSAttributedString(string: text, attributes: (GlobalConstants.FieldAddLocationAttributes as! [NSAttributedString.Key : Any]))
        btnField.setAttributedTitle(attributedText, for: .normal)
        
        hideDropDownView()
    }
    
    @objc func showDropDownView() {
        UIView.animate(withDuration: 0.2, animations: {
            self.yesNoContainer.frame = CGRect.init(x: 0, y: self.btnField.frame.maxY, width: self.yesNoContainer.frame.width, height: self.yesNoContainer.subviews.last!.frame.maxY)
        })
        self.frame = CGRect.init(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.yesNoContainer.frame.maxY)
        btnField.removeTarget(nil, action: nil, for: .allEvents)
        btnField.addTarget(self, action: #selector(hideDropDownView), for: UIControl.Event.touchUpInside)

    }
    
    @objc func hideDropDownView() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.yesNoContainer.frame = CGRect.init(x: 0, y: self.btnField.frame.maxY, width: self.yesNoContainer.frame.width, height: 0)
        })
        self.frame = CGRect.init(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: singleLineHeight)
        btnField.removeTarget(nil, action: nil, for: .allEvents)
        btnField.addTarget(self, action: #selector(showDropDownView), for: UIControl.Event.touchUpInside)
        
    }

}
