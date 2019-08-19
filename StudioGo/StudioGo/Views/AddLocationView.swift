//
//  AddLocationView.swift
//  StudioGo
//
//  Created by Owner on 6/5/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class AddLocationView: UIView, UITextFieldDelegate {

    private let screenXCenter = Screen.width/2

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
    let smallFieldHeight:CGFloat = 26

    let provinceDropDownObj = DropDownView(items: ["PROVINCE*", "ONTARIO"], addIcon: 0)
    let countryDropDownObj = DropDownView(items: ["COUNTRY*", "CANADA"], addIcon: 0)
    
    let publicPrivateDropDownObj = DropDownView(items: ["PUBLIC OR PRIVATE*", "PUBLIC", "PRIVATE"], addIcon: 0)
    let permitDropDownObj = DropDownView(items: ["PERMIT?*", "REQUIRED", "NONE"], addIcon: 0)
    let costDropDownObj = DropDownView(items: ["PRICE*", "$", "$$", "$$$", "$$$$", "$$$$$"], addIcon: 0)
    let spaceTypeDropDownObj = DropDownView(items: ["TYPE OF SPACE*", "PERSONAL", "COLLABORATIVE", "PRESENTATION", "MAKING", "INTERMISSION"], addIcon: 1)
    let accessibilityDropDownObj = DropDownView(items: ["ACCESSIBILITY*", "NOT ACCESSIBLE", "SOMEWHAT ACCESSIBILE", "ACCESSIBILE"], addIcon: 2)
    
    var locationNameField = UITextField()
    var streetNumberField = UITextField()
    var streetAddressField = UITextField()
    var cityField = UITextField()
    var postalCodeField = UITextField()
    var provinceDropDown = UIView()
    var countryDropDown = UIView()
    
    var costDropDown = UIView()
    var isPublicDropDown = UIView()
    var spaceTypeDropDown = UIView()
    var hasPermitDropDown = UIView()
    var accessibilityDropDown = UIView()

    var descriptionField = UITextField()
    var equipmentField = UITextField()
    
    var submitBtn = UIButton()
    
    let scrollView = UIScrollView()
    
    var lastPoint = CGPoint.init(x: 0, y: 0)

    init() {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        locationNameField.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width, height: (scrollView.frame.size.height + 300))// To be more specific, I have used multiple textfields so wanted to scroll to the end.So have given the constant 300.
    }
    
    func textFieldDidBeginEditing(_ textField:UITextField) {
//        if textField.tag == 4 { //tag value of the textfield which are at the bottom
            let point:CGPoint = CGPoint.init(x: 0, y: textField.frame.origin.y-80)
            self.scrollView.setContentOffset(point, animated: true)
//        }
    }
    
    func setupView() -> UIView {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        self.addSubview(scrollView)
        
        let fullWidth:CGFloat = _screenWidth-sidePadding*2
        let halfWidth:CGFloat = fullWidth/2-(padding/2)
        
//        self.frame = CGRect(x: 0, y: 0, width: _screenWidth, height: _screenHeight)
    
        let viewLabelWidth = _screenWidth
        let viewLabelText = attributeText(type: 1, text: "ADD LOCATION")
        let viewLabelTextHeight = viewLabelText.height(withConstrainedWidth: viewLabelWidth)
        let viewLabelFrame = CGRect.init(x: centerView(width: viewLabelWidth), y: 72, width: viewLabelWidth, height: viewLabelTextHeight)
        let viewLabel = titleLabel(frame: viewLabelFrame, text: viewLabelText, align: .center)
        scrollView.addSubview(viewLabel)
        
        let lineDivide = drawLine(x: centerView(width: _screenWidth/3), y: scrollView.subviews.last!.frame.maxY+padding, width: _screenWidth/3)
        scrollView.addSubview(lineDivide)
        
        let uploadLabelWidth = _screenWidth
        let uploadLabelText = attributeText(type: 2, text: "UPLOAD MEDIA")
        let uploadLabelTextHeight = uploadLabelText.height(withConstrainedWidth: uploadLabelWidth)
        let uploadLabelFrame = CGRect.init(x: centerView(width: uploadLabelWidth), y: scrollView.subviews.last!.frame.maxY+padding, width: uploadLabelWidth, height: uploadLabelTextHeight)
        let uploadLabel = titleLabel(frame: uploadLabelFrame, text: uploadLabelText, align: .center)
        scrollView.addSubview(uploadLabel)
        
        let uploadImageView = UIView()
        uploadImageView.frame = CGRect.init(x: padding, y: scrollView.subviews.last!.frame.maxY+padding, width: _screenWidth-(padding*2), height: _screenWidth/4)
        let btn = uploadImageButton(view: uploadImageView)
        uploadImageView.addSubview(btn)
        let btn2 = uploadImageButton(view: uploadImageView)
        uploadImageView.addSubview(btn2)
        let btn3 = uploadImageButton(view: uploadImageView)
        uploadImageView.addSubview(btn3)
        let btn4 = uploadImageButton(view: uploadImageView)
        uploadImageView.addSubview(btn4)
        scrollView.addSubview(uploadImageView)
        
        let locationAddressLabelWidth = _screenWidth
        let locationAddressLabelText = attributeText(type: 2, text: "location address")
        let locationAddressLabelTextHeight = locationAddressLabelText.height(withConstrainedWidth: locationAddressLabelWidth)
        let locationAddressLabelFrame = CGRect.init(x: centerView(width: locationAddressLabelWidth), y: scrollView.subviews.last!.frame.maxY+padding, width: locationAddressLabelWidth, height: locationAddressLabelTextHeight)
        let locationAddressLabel = titleLabel(frame: locationAddressLabelFrame, text: locationAddressLabelText, align: .center)
        scrollView.addSubview(locationAddressLabel)
        
        locationNameField = roundedTextBox(placeHolder: "LOCATION NAME*", x: sidePadding, y: scrollView.subviews.last!.frame.maxY+padding, width: fullWidth, height: singleLineHeight)
        scrollView.addSubview(locationNameField)
        
        let extraSpace:CGFloat = fullWidth*(1/14)
        var middleExtraSpace:CGFloat = extraSpace/2
        streetNumberField = roundedTextBox(placeHolder: "ST NO*", x: sidePadding, y: scrollView.subviews.last!.frame.maxY, width: fullWidth*(3/14), height: smallFieldHeight)
        streetAddressField = roundedTextBox(placeHolder: "STREET*", x: streetNumberField.frame.maxX+middleExtraSpace, y: scrollView.subviews.last!.frame.maxY, width: fullWidth*(6/14), height: smallFieldHeight)
        cityField = roundedTextBox(placeHolder: "CITY*", x: streetAddressField.frame.maxX+middleExtraSpace, y: scrollView.subviews.last!.frame.maxY, width: fullWidth*(4/14), height: smallFieldHeight)
        scrollView.addSubview(streetNumberField)
        scrollView.addSubview(streetAddressField)
        scrollView.addSubview(cityField)
        
        middleExtraSpace = fullWidth*1/32
        provinceDropDown = provinceDropDownObj.createDropDownView(x:sidePadding, y: scrollView.subviews.last!.frame.maxY, width: fullWidth*(5/16), height: smallFieldHeight)
        countryDropDown = countryDropDownObj.createDropDownView(x: provinceDropDown.frame.maxX+middleExtraSpace, y: scrollView.subviews.last!.frame.maxY, width: fullWidth*(5/16), height: smallFieldHeight)
        postalCodeField = roundedTextBox(placeHolder: "POSTAL CODE", x: countryDropDown.frame.maxX+middleExtraSpace, y: scrollView.subviews.last!.frame.maxY, width: fullWidth*(5/16), height: smallFieldHeight)
        scrollView.addSubview(provinceDropDown)
        scrollView.addSubview(countryDropDown)
        scrollView.addSubview(postalCodeField)
        
        let spaceInfoLabelWidth = _screenWidth
        let spaceInfoLabelText = attributeText(type: 2, text: "space information")
        let spaceInfoLabelTextHeight = spaceInfoLabelText.height(withConstrainedWidth: spaceInfoLabelWidth)
        let spaceInfoLabelFrame = CGRect.init(x: centerView(width: spaceInfoLabelWidth), y: scrollView.subviews.last!.frame.maxY+padding*2.5, width: spaceInfoLabelWidth, height: spaceInfoLabelTextHeight)
        let spaceInfoLabel = titleLabel(frame: spaceInfoLabelFrame, text: spaceInfoLabelText, align: .center)
        scrollView.addSubview(spaceInfoLabel)
        
        costDropDown = costDropDownObj.createDropDownView(x: sidePadding, y: scrollView.subviews.last!.frame.maxY, width: halfWidth, height: smallFieldHeight)
        isPublicDropDown = publicPrivateDropDownObj.createDropDownView(x: costDropDown.frame.maxX+padding, y: scrollView.subviews.last!.frame.maxY, width: halfWidth, height: smallFieldHeight)
        scrollView.addSubview(costDropDown)
        scrollView.addSubview(isPublicDropDown)
        
        spaceTypeDropDown = spaceTypeDropDownObj.createDropDownView(x: sidePadding, y: scrollView.subviews.last!.frame.maxY, width: halfWidth, height: smallFieldHeight)
        hasPermitDropDown = permitDropDownObj.createDropDownView(x: spaceTypeDropDown.frame.maxX+padding, y: scrollView.subviews.last!.frame.maxY, width: halfWidth, height: smallFieldHeight)
        scrollView.addSubview(spaceTypeDropDown)
        scrollView.addSubview(hasPermitDropDown)
        
        accessibilityDropDown = accessibilityDropDownObj.createDropDownView(x: sidePadding, y: scrollView.subviews.last!.frame.maxY, width: fullWidth, height: smallFieldHeight)
        
        scrollView.addSubview(accessibilityDropDown)

        descriptionField = roundedTextBox(placeHolder: "DESCRIBE THIS LOCATION*", x: sidePadding, y: scrollView.subviews.last!.frame.maxY, width: fullWidth, height: singleLineHeight*2)
        descriptionField.tag = 4
        scrollView.addSubview(descriptionField)

        let equipmentLabelWidth = _screenWidth
        let equipmentLabelText = attributeText(type: 2, text: "equipment")
        let equipmentLabelTextHeight = equipmentLabelText.height(withConstrainedWidth: equipmentLabelWidth)
        let equipmentLabelFrame = CGRect.init(x: centerView(width: equipmentLabelWidth), y: scrollView.subviews.last!.frame.maxY+padding*2, width: equipmentLabelWidth, height: equipmentLabelTextHeight)
        let equipmentLabel = titleLabel(frame: equipmentLabelFrame, text: equipmentLabelText, align: .center)
        scrollView.addSubview(equipmentLabel)
        
        equipmentField = roundedTextBox(placeHolder: "AVAILABLE EQUIPMENT", x: sidePadding, y: scrollView.subviews.last!.frame.maxY, width: fullWidth, height: singleLineHeight)
        equipmentField.tag = 4
        scrollView.addSubview(equipmentField)
        
        
//
        submitBtn = roundedButton(text: "SUBMIT", y: scrollView.subviews.last!.frame.maxY, width: _screenWidth/2, height: singleLineHeight*1, action: #selector(submitLocation))
        
        scrollView.addSubview(submitBtn)
        
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        scrollView.contentSize.height = scrollView.subviews.last!.frame.maxY+(padding*2)
        
        scrollView.bringSubviewToFront(accessibilityDropDown)
        scrollView.bringSubviewToFront(hasPermitDropDown)
        scrollView.bringSubviewToFront(spaceTypeDropDown)
        scrollView.bringSubviewToFront(isPublicDropDown)
        scrollView.bringSubviewToFront(costDropDown)
        scrollView.bringSubviewToFront(countryDropDown)
        scrollView.bringSubviewToFront(provinceDropDown)

        return self
    }
    
    @objc func pushSpaceTypeVC() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushSpaceTypeVC"), object: nil)
    }
    
    func addMoreInfoIcon(x: CGFloat, y: CGFloat, moreInfoPage: Selector) -> UIButton {
        let moreInfoIconSize:CGFloat = 10
        
        let moreInfoIcon = UIButton(frame: CGRect.init(x: x, y: y, width: moreInfoIconSize, height: moreInfoIconSize))
        moreInfoIcon.titleLabel?.font = UIFont.fontAwesome(ofSize: moreInfoIconSize, style: .solid)
        moreInfoIcon.setTitle(String.fontAwesomeIcon(name: .questionCircle), for: .normal)
        moreInfoIcon.setTitleColor(studioGrey, for: .normal)
        
        moreInfoIcon.addTarget(self, action: moreInfoPage, for: .touchUpInside)
        
        return moreInfoIcon
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
        let cornerRadius:CGFloat = height/2
        
        let attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: (GlobalConstants.FieldAddLocationAttributes as! [NSAttributedString.Key : Any]))
        let attributedTitle = NSAttributedString(string: "", attributes: (GlobalConstants.FieldAddLocationAttributes as! [NSAttributedString.Key : Any]))

        let textField = UITextField()
        textField.frame = CGRect.init(x: x, y: y+padding, width: width, height: height)
        
        textField.attributedText = attributedTitle
        textField.attributedPlaceholder = attributedPlaceholder
        
        textField.isUserInteractionEnabled = true
        textField.font = GlobalConstants.fieldTypingAddLocationFont
        textField.textColor = GlobalConstants.studioGrey
        textField.backgroundColor = GlobalConstants.studioLightGrey
        textField.textAlignment = .center
        textField.autocapitalizationType = .allCharacters
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        textField.resignFirstResponder()
        print("RETURN")
        let point:CGPoint = lastPoint
        self.scrollView.setContentOffset(point, animated: true)
        return false
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
        if (accessibilityDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"ACCESSIBILITY\")") { isFieldsFilled = false ;  }
        if (!cityField.hasText) { isFieldsFilled = false }
        if (costDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"COST\")") { isFieldsFilled = false ;  }
        if (countryDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"COUNTRY\")") { isFieldsFilled = false ;  }
        if (!descriptionField.hasText) { isFieldsFilled = false ; print("description") }
        if (!locationNameField.hasText) { isFieldsFilled = false }
        if (permitDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"PERMIT?\")") { isFieldsFilled = false ;  }
        if (publicPrivateDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"PUBLIC OR PRIVATE\")") { isFieldsFilled = false ;  }
        if (!postalCodeField.hasText) { isFieldsFilled = false }
        if (provinceDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"PROVINCE\")")  { isFieldsFilled = false ;  }
        if (spaceTypeDropDownObj.btnField.titleLabel?.attributedText?.string == "Optional(\"SPACE TYPE\")") { isFieldsFilled = false ;  }
        if (!streetAddressField.hasText) { isFieldsFilled = false }
        if (!streetNumberField.hasText) { isFieldsFilled = false }
        if (!equipmentField.hasText) { isFieldsFilled = false }
//        if (!websiteField.hasText) { isFieldsFilled = false }
        
        if ( isFieldsFilled ) {

            let accessibility = accessibilityDropDownObj.btnField.titleLabel?.attributedText?.string
            let city = cityField.text
            let cost = costDropDownObj.btnField.titleLabel?.attributedText?.string
            let country = countryDropDownObj.btnField.titleLabel?.attributedText?.string
            let description = descriptionField.text
            let hasPermit = permitDropDownObj.btnField.titleLabel?.attributedText?.string
            let isPrivate = publicPrivateDropDownObj.btnField.titleLabel?.attributedText?.string
            let locationTitle = locationNameField.text
            let postalCode = postalCodeField.text
            let province = provinceDropDownObj.btnField.titleLabel?.attributedText?.string
            let spaceType = spaceTypeDropDownObj.btnField.titleLabel?.attributedText?.string
            let street = streetAddressField.text ?? "York Street"
            let streetNumber = streetNumberField.text ?? "1"
            let equipment = equipmentField.text
            
            let streetAddress = streetNumber + " " + street

            let userInfo:[String: Any?] = ["accessibility": accessibility, "city": city, "cost": cost, "country": country, "description": description, "hasPermit": hasPermit, "images":["Daniels"], "isPrivate": isPrivate, "location": locationTitle, "postalCode": postalCode, "province": province, "spaceType": spaceType, "streetAddress": streetAddress, "equipment": equipment]
            print(userInfo)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "submitLocationNotification"), object: nil, userInfo: userInfo as [AnyHashable : Any])
        }
        
    }
    
    func drawLine(x: CGFloat, y: CGFloat, width: CGFloat) -> UIView {
        let line = UIView.init(frame: .init(x: x, y: y, width: width, height: 1))
        line.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return line
    }
    
    func centerView(width: CGFloat) -> CGFloat {
        return _screenWidth/2 - width/2
    }
    
    func titleLabel(frame: CGRect, text: String, type: Int, align: NSTextAlignment) -> UILabel {
        let label = UILabel.init(frame: frame)
        
        label.attributedText = attributeText(type: type, text: text)
        label.textAlignment = align
        
        return label
    }
    
    func titleLabel(frame: CGRect, text: NSAttributedString, align: NSTextAlignment) -> UILabel {
        let label = UILabel.init(frame: frame)
        
        label.attributedText = text
        label.textAlignment = align
        
        return label
    }
    
    func attributeText(type: Int, text: String) -> NSAttributedString {
        let attrType = type==1 ? GlobalConstants.TitleAddLocationAttributes : type==2 ?  GlobalConstants.SubtitleAddLocationAttributes : type==3 ? GlobalConstants.FieldAddLocationAttributes : GlobalConstants.TagAddLocationAttributes
        return NSAttributedString(string: text.uppercased(), attributes: (attrType as! [NSAttributedString.Key : Any]))
    }

}
