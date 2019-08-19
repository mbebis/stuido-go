//
//  searchBarView.swift
//  StudioGo
//
//  Created by Owner on 7/11/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class SearchBarView: UITextField {

    private let _screenWidth = GlobalConstants.screenWidth
    private let _screenHeight = GlobalConstants.screenHeight
    
    private let tabbarHeight:CGFloat = GlobalConstants.tabbarHeight
    private let navBarHeight:CGFloat = GlobalConstants.navBarHeight
    private let statusBarHeight:CGFloat = GlobalConstants.statusBarHeight
    
    init(frame: CGRect, placeholder: NSAttributedString) {
        super.init(frame: frame)
        self.attributedPlaceholder = placeholder
    }
    
    init(placeholder: NSAttributedString) {
        super.init(frame: .zero)
        self.attributedPlaceholder = placeholder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> UITextField {
//        let navBarHeight = 72
        
//        self.frame = CGRect(x: (_screenWidth/2)-((_screenWidth-40)/2), y: CGFloat.init(navBarHeight+16), width: _screenWidth-40, height: CGFloat.init(32))
        
        self.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 24, height: self.frame.height))
        
        self.isUserInteractionEnabled = false
//        self.font = UIFont.systemFont(ofSize: 15)
        self.borderStyle = UITextField.BorderStyle.roundedRect
        self.layer.borderColor = (UIColor.white).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.bounds.height / 2.0
        self.layer.masksToBounds = true
        self.autocorrectionType = UITextAutocorrectionType.no
        self.keyboardType = UIKeyboardType.default
        self.returnKeyType = UIReturnKeyType.done
        self.clearButtonMode = UITextField.ViewMode.whileEditing
        self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.delegate = self as? UITextFieldDelegate
        
        return self
    }
    
    func setFrame(frame: CGRect) {
        self.frame = frame
    }
    
    func setBackgroundColour(colour: UIColor) {
        self.backgroundColor = colour
    }
    
    func setLeftViewImage(image: UIImage) {
        let searchIconView = UIImageView(frame: CGRect.init(x: (24/2)-6, y: (self.frame.height/2)-10, width: 20, height: 20))
        searchIconView.image = image
        self.leftView?.addSubview(searchIconView)
        self.leftViewMode = UITextField.ViewMode.always
    }

}
