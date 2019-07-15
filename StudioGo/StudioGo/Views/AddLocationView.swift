//
//  AddLocationView.swift
//  StudioGo
//
//  Created by Owner on 6/5/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class AddLocationView: UIView {

    private let _screenWidth = GlobalConstants.screenWidth
    private let _screenHeight = GlobalConstants.screenHeight
    
    private let mediumFont:UIFont = GlobalConstants.mediumFont
    private let regularFont:UIFont = GlobalConstants.regularFont
    private let lightFont:UIFont = GlobalConstants.lightFont
    
    private let studioGrey = GlobalConstants.studioGrey
    private let studioYellow = GlobalConstants.studioYellow
    private let studioLightGrey = GlobalConstants.studioLightGrey

    let padding:CGFloat = 6
    let sidePadding:CGFloat = 12
    let extraPadding:CGFloat = 3
    let singleLineHeight:CGFloat = 28

    let publicPrivateDropDownObj = DropDownView(items: ["PUBLIC OR PRIVATE", "PUBLIC", "PRIVATE"])
    let permitDropDownObj = DropDownView(items: ["PERMIT?", "REQUIRED", "NONE"])
    let provinceDropDownObj = DropDownView(items: ["PROVINCE", "ONTARIO"])
    let countryDropDownObj = DropDownView(items: ["COUNTRY", "CANADA"])
    
    var locationNameField = UITextField()
    var streetAddressField = UITextField()
    var cityField = UITextField()
    var postalCodeField = UITextField()
    var provinceDropDown = UIView()
    var countryDropDown = UIView()
    var websiteField = UITextField()
    var costField = UITextField()
    var isPublicDropDown = UIView()
    var hasPermitDropDown = UIView()
    var descriptionField = UITextField()
    var tagsField = UITextField()
    
    var submitBtn = UIButton()

    func setupView() -> UIView {
        let halfWidth:CGFloat = _screenWidth/2-sidePadding-padding
        let fullWidth:CGFloat = _screenWidth-sidePadding*2
        
        self.frame = CGRect(x: 0, y: 0, width: _screenWidth, height: _screenHeight)
    

        let viewLabel = label(text: "ADD LOCATION", font: mediumFont, y: 86)//og 86
        self.addSubview(viewLabel)
        let lineDivide = UIView()
        lineDivide.frame = CGRect.init(x: _screenWidth/2-_screenWidth/6, y: self.subviews.last!.frame.maxY+extraPadding, width: _screenWidth/3, height: 1)
        lineDivide.backgroundColor = .black
        self.addSubview(lineDivide)
        let uploadLabel = label(text: "UPLOAD MEDIA", font: regularFont, y: self.subviews.last!.frame.maxY+padding)
        self.addSubview(uploadLabel)
        
        let uploadImageView = UIView()
        uploadImageView.frame = CGRect.init(x: padding, y: self.subviews.last!.frame.maxY, width: _screenWidth-(padding*2), height: _screenWidth/4)
        let btn = uploadImageButton(view: uploadImageView)
        uploadImageView.addSubview(btn)
        let btn2 = uploadImageButton(view: uploadImageView)
        uploadImageView.addSubview(btn2)
        let btn3 = uploadImageButton(view: uploadImageView)
        uploadImageView.addSubview(btn3)
        let btn4 = uploadImageButton(view: uploadImageView)
        uploadImageView.addSubview(btn4)
        self.addSubview(uploadImageView)
        
        locationNameField = roundedTextBox(placeHolder: "LOCATION NAME", x: sidePadding, y: self.subviews.last!.frame.maxY, width: fullWidth, height: singleLineHeight)
        self.addSubview(locationNameField)
        streetAddressField = roundedTextBox(placeHolder: "STREET ADDRESS", x: sidePadding, y: self.subviews.last!.frame.maxY, width: fullWidth, height: singleLineHeight)
        self.addSubview(streetAddressField)
        cityField = roundedTextBox(placeHolder: "CITY", x: sidePadding, y: self.subviews.last!.frame.maxY, width: halfWidth, height: singleLineHeight)
        postalCodeField = roundedTextBox(placeHolder: "POSTAL CODE", x: cityField.frame.maxX+padding*2, y: self.subviews.last!.frame.maxY, width: halfWidth, height: singleLineHeight)
        self.addSubview(cityField)
        self.addSubview(postalCodeField)
        provinceDropDown = provinceDropDownObj.createDropDownView(x:sidePadding, y: self.subviews.last!.frame.maxY, width: _screenWidth/2-sidePadding-padding)
        countryDropDown = countryDropDownObj.createDropDownView(x: _screenWidth/2+padding, y: self.subviews.last!.frame.maxY, width: _screenWidth/2-sidePadding-padding)
        self.addSubview(provinceDropDown)
        self.addSubview(countryDropDown)
        websiteField = roundedTextBox(placeHolder: "WEBSITE", x: sidePadding, y: self.subviews.last!.frame.maxY, width: halfWidth, height: singleLineHeight)
        costField = roundedTextBox(placeHolder: "COST", x: websiteField.frame.maxX+(padding*2), y: self.subviews.last!.frame.maxY, width: halfWidth, height: singleLineHeight)
        self.addSubview(websiteField)
        self.addSubview(costField)
        
        isPublicDropDown = publicPrivateDropDownObj.createDropDownView(x: sidePadding, y: self.subviews.last!.frame.maxY, width: _screenWidth/2-sidePadding-padding)
        hasPermitDropDown = permitDropDownObj.createDropDownView(x: _screenWidth/2+padding, y: self.subviews.last!.frame.maxY, width: _screenWidth/2-sidePadding-padding)
        self.addSubview(isPublicDropDown)
        self.addSubview(hasPermitDropDown)

        descriptionField = roundedTextBox(placeHolder: "DESCRIBE THIS LOCATION", x: sidePadding, y: self.subviews.last!.frame.maxY, width: fullWidth, height: singleLineHeight*2)
        self.addSubview(descriptionField)
//
        tagsField = roundedTextBox(placeHolder: "TAGS (EX. STUDIO, PUBLIC, PAINTING, PHOTOGRAPHY)", x: sidePadding, y: self.subviews.last!.frame.maxY, width: fullWidth, height: singleLineHeight)
        self.addSubview(tagsField)
//
        submitBtn = roundedButton(text: "SUBMIT", y: self.subviews.last!.frame.maxY, width: _screenWidth/2, height: singleLineHeight*1, action: #selector(submitLocation))
        
        self.addSubview(submitBtn)
        
        self.bringSubviewToFront(provinceDropDown)
        self.bringSubviewToFront(countryDropDown)
        self.bringSubviewToFront(isPublicDropDown)
        self.bringSubviewToFront(hasPermitDropDown)

        return self
    }
    
    func uploadImageButton(view: UIView) -> UIButton {
        let cellPadding: CGFloat = 2
        let width = (view.frame.width - (cellPadding*3*2))/4
        let height = width
        let x = ((view.subviews.last?.frame.maxX) != nil) ? ((view.subviews.last?.frame.maxX)!)+(cellPadding*2): CGFloat.init(0)
        let y = view.subviews.last?.frame.minY ?? 0

        let btn = UIButton.init(frame: CGRect.init(x: x, y: y, width: width, height: height-cellPadding))
        btn.backgroundColor = studioYellow
        
        let btnImage = UIImage.fontAwesomeIcon(name: .plus, style: .solid, textColor: .white, size: CGSize.init(width: btn.frame.width/3, height: btn.frame.width/3))
        
        btn.setImage(btnImage, for: .normal)
        
        return btn
    }
    
    func label(text: String, font: UIFont, y: CGFloat) -> UILabel {
        let label = UILabel()

        let attributedTitle = NSAttributedString(string: text, attributes: (GlobalConstants.blackTextLightAttr as! [NSAttributedString.Key : Any]))
        
        label.attributedText = attributedTitle
        label.font = font
        label.frame = CGRect.init(x: 0, y: y, width: _screenWidth, height: singleLineHeight)
        label.textAlignment = .center
        
        return label
    }
    
    func roundedTextBox(placeHolder: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UITextField {
        let cornerRadius:CGFloat = singleLineHeight/2
        
        let attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: (GlobalConstants.blackTextLightAttr as! [NSAttributedString.Key : Any]))
        let attributedTitle = NSAttributedString(string: "", attributes: (GlobalConstants.blackTextLightAttr as! [NSAttributedString.Key : Any]))

        let textField = UITextField()
        textField.frame = CGRect.init(x: x, y: y+padding, width: width, height: height)
        
        textField.attributedText = attributedTitle
        textField.attributedPlaceholder = attributedPlaceholder
        
        textField.isUserInteractionEnabled = true
        textField.font = GlobalConstants.lightFont
        textField.textColor = .black
        textField.backgroundColor = GlobalConstants.studioLightGrey
        textField.textAlignment = .center
////        textField.tintColor = .white
//        textField.borderStyle = UITextField.BorderStyle.roundedRect
//        textField.layer.backgroundColor = (UIColor.lightGray).cgColor
//        textField.layer.borderColor = (UIColor.lightGray).cgColor
//        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = cornerRadius
        textField.layer.masksToBounds = true
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
//        textField.clearButtonMode = UITextField.ViewMode.
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self as? UITextFieldDelegate
//        textField.text.textAlignment=NSTextAlignmentCenter;
        
        return textField
    }
    
    func roundedButton(text: String, y: CGFloat, width: CGFloat, height: CGFloat, action: Selector) -> UIButton {
        
        let attributedTitle = NSAttributedString(string: text, attributes: (GlobalConstants.whiteTextRegularAttr as! [NSAttributedString.Key : Any]))
        
        let btn = UIButton.init(frame: CGRect.init(x: _screenWidth/2-width/2, y: y+padding*2, width: width, height: height))
        btn.backgroundColor = studioYellow
        btn.setTitleColor(.white, for: .normal)
        btn.setAttributedTitle(attributedTitle, for: .normal)
        btn.layer.cornerRadius = height/2
        
        btn.addTarget(self, action: action, for: UIControl.Event.touchUpInside)
        
        return btn
    }
    
    @objc func submitLocation() {
        var isFieldsFilled = true
        if (!cityField.hasText) { isFieldsFilled = false }
        if (!costField.hasText) { isFieldsFilled = false }
        if (countryDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"COUNTRY\")") { isFieldsFilled = false ; print(countryDropDownObj.btnField.titleLabel?.attributedText?.string) }
        if (!descriptionField.hasText) { isFieldsFilled = false ; print("description") }
        if (permitDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"PERMIT?\")") { isFieldsFilled = false ; print(permitDropDownObj.btnField.titleLabel?.attributedText?.string) }
        if (publicPrivateDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"PUBLIC OR PRIVATE\")") { isFieldsFilled = false ; print(publicPrivateDropDownObj.btnField.titleLabel?.attributedText?.string) }
        if (!locationNameField.hasText) { isFieldsFilled = false }
        if (!postalCodeField.hasText) { isFieldsFilled = false }
        if (provinceDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"PROVINCE\")")  { isFieldsFilled = false ; print(provinceDropDownObj.btnField.titleLabel?.attributedText?.string) }
        if (!streetAddressField.hasText) { isFieldsFilled = false }
        if (!tagsField.hasText) { isFieldsFilled = false }
        if (!websiteField.hasText) { isFieldsFilled = false }
        
        if ( isFieldsFilled ) {

            let city = cityField.text
            let cost = costField.text
            let country = countryDropDownObj.btnField.titleLabel?.attributedText?.string
            let description = descriptionField.text
            let hasPermit = permitDropDownObj.btnField.titleLabel?.attributedText?.string
            let isPrivate = publicPrivateDropDownObj.btnField.titleLabel?.attributedText?.string
            let locationTitle = locationNameField.text
            let postalCode = postalCodeField.text
            let province = provinceDropDownObj.btnField.titleLabel?.attributedText?.string
            let streetAddress = streetAddressField.text
            let tags = tagsField.text
            let website = websiteField.text

            let userInfo:[String: Any] = ["city": city, "cost": cost, "country": country, "description": description, "hasPermit": hasPermit, "isPrivate": isPrivate, "location": locationTitle, "postalCode": postalCode, "province": province, "streetAddress": streetAddress, "tags": tags, "website": website]
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "submitLocationNotification"), object: nil, userInfo: userInfo)
        }
        
    }
    
    func addLocation() {
        
//        MapViewController().addLocation(json: "23 Regency View Heights, Maple, ON L6A3T9, Canada")
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
