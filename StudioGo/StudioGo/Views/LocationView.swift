//
//  LocationView.swift
//  StudioGo
//
//  Created by Owner on 6/20/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit
import FontAwesome_swift

class LocationView: UIView {

    private let _screenWidth = GlobalConstants.screenWidth
    private let _screenHeight = GlobalConstants.screenHeight
    
    private let screenXCenter = Screen.width/2
    
    private let statusBarHeight:CGFloat = UIApplication.shared.statusBarFrame.height
    
    private let mediumFont:UIFont = GlobalConstants.mediumFont
    private let regularFont:UIFont = GlobalConstants.regularFont
    private let lightFont:UIFont = GlobalConstants.lightFont
    
    private let studioYellow = GlobalConstants.studioYellow
    private let buttonYellow = GlobalConstants.buttonYellow
    private let studioGrey = GlobalConstants.studioGrey
    
    private let scrollView = UIScrollView()
    
    private var infoPane = UIView()
    private var secondaryPane = UIView()

    private var bookmarkBtn = UIButton()
    private var shareBtn = UIButton()
    
    private var locationTypeLabel = UILabel()
    private var locationLabel = UILabel()
    private var addressLabel = UILabel()
    
    private var priceIcons: Array<UIImageView> = []
    private var starIcons: Array<UIImageView> = []
    
    private var priceLabel = UILabel()

    
    private var descriptionText = UILabel()
    
    private var postedByLabel = UILabel()
    
    private var directionsBtn = UIButton()
    
    private var spaceLabel = UILabel()
    private var spaceTypeLabel = UILabel()
    private var spaceMoreInfoIcon = UIButton()
    
    private var equipmentLabel = UILabel()
    private var equipmentTypeLabel = UILabel()
    private var equipmentMoreInfoIcon = UIButton()

    private var accessibileLabel = UILabel()
    private var accessibilityTypeLabel = UILabel()
    private var accessibilityMoreInfoIcon = UIButton()

    private var permitLabel = UILabel()
    private var permitTypeLabel = UILabel()
    private var permitMoreInfoIcon = UIButton()

    private var contactLabel = UILabel()
    private var contactStudioGoBtn = UIButton()
    private var contactPosterBtn = UIButton()

    private var checkInBtn = UIButton()
    private var reviewBtn = UIButton()
    
    private var viewAllBtn = UIButton()
    
    private var informationLabel = UILabel()
    
    private var image = UIImage()
    private var imagePane = UIImageView()
    
    private let viewPadding:CGFloat = 40

    init() {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
    }
    
    init(location: Location) {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))

        self.locationTypeLabel.attributedText = attributeText(type: 1, text: (location.isPrivate) ? "Private Location" : "Public Location")
        self.locationLabel.attributedText = attributeText(type: 3, text: location.locationTitle)
        self.addressLabel.attributedText = attributeText(type: 1, text: location.city + "," + location.province)
        self.descriptionText.attributedText = NSAttributedString(string: location.description, attributes: (GlobalConstants.TextBoxInfoAttributes as! [NSAttributedString.Key : Any]))
        
        self.spaceTypeLabel.attributedText = attributeText(type: 1, text: location.spaceType)
        self.equipmentTypeLabel.attributedText = attributeText(type: 1, text: location.equipment)
        self.accessibilityTypeLabel.attributedText = attributeText(type: 1, text: location.accessibility)
        self.permitTypeLabel.attributedText = attributeText(type: 2, text: ((location.hasPermit) ? "Required" : "None"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView(location: Location) -> UIView {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        self.addSubview(scrollView)
    
        locationBannerImage()
        informationPane()
        populateView(location: location)
        //        tableView()
//        moreInfoTableView()
    
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
        scrollView.contentSize.height = scrollView.subviews.last!.frame.maxY
        
        return self
    }
    
    func locationBannerImage() {
        image = UIImage.init(named: "LocationBanner")!
        imagePane = UIImageView(frame: .init(x: 0, y: 72-statusBarHeight, width: Screen.width, height: Screen.height*(7/27)))
        imagePane.image = image
        imagePane.backgroundColor = .lightGray
        imagePane.contentMode = .scaleAspectFill
        imagePane.clipsToBounds = true
        imagePane.layer.masksToBounds = true
        scrollView.addSubview(imagePane)
    }
    
    func informationPane() {
        //        let infoPane = UIView(frame: CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: Screen.height*(3/9)))
        //                infoPane.backgroundColor = .blue
        
        let cornerBtnWidth: CGFloat = 24
        let cornerBtnPadding: CGFloat = 10
        bookmarkBtn = iconBtn(frame: CGRect.init(x: cornerBtnPadding, y: cornerBtnPadding, width: cornerBtnWidth, height: cornerBtnWidth), icon: String.fontAwesomeIcon(name: .bookmark), style: .regular)
        infoPane.addSubview(bookmarkBtn)
        shareBtn = iconBtn(frame: CGRect.init(x: Screen.width-cornerBtnPadding-cornerBtnWidth, y: cornerBtnPadding, width: cornerBtnWidth, height: cornerBtnWidth), icon: String.fontAwesomeIcon(name: .shareSquare), style: .solid)
        infoPane.addSubview(shareBtn)
        
        let labelWidth = Screen.width*(2/3)
        let largeLabelHeight: CGFloat = 20
        let labelHeight: CGFloat = 10
        let labelPadding: CGFloat = 8
        
        locationTypeLabel = titleLabel(frame: CGRect.init(x: screenXCenter-labelWidth/2, y: 12, width: labelWidth, height: labelHeight), text: "PUBLIC LOCATION", type: 1, align: .center)
        infoPane.addSubview(locationTypeLabel)
        locationLabel = titleLabel(frame: CGRect.init(x: screenXCenter-_screenWidth/2, y: locationTypeLabel.frame.maxY+2, width: _screenWidth, height: largeLabelHeight), text: "GRAFFITI ALLEY", type: 3, align: .center)
        infoPane.addSubview(locationLabel)
        addressLabel = titleLabel(frame: CGRect.init(x: screenXCenter-labelWidth/2, y: locationLabel.frame.maxY+2, width: labelWidth, height: labelHeight), text: "TORONTO, ON", type: 1, align: .center)
        infoPane.addSubview(addressLabel)
        
//        priceLabel = titleLabel(frame: CGRect.init(x: screenXCenter-labelWidth/2, y: locationLabel.frame.maxY+8, width: labelWidth, height: labelHeight), text: "$$$$$", type: 1, align: .center)
//        infoPane.addSubview(priceLabel)

        priceIcons = drawSymbols(view: infoPane, symbolImage: UIImage.fontAwesomeIcon(name: .dollarSign, style: .solid, textColor: studioGrey, size: .init(width: 16, height: 16)), size: 16, padding: 8, length: 5)
        
        starIcons = drawSymbols(view: infoPane, symbolImage: UIImage.fontAwesomeIcon(name: .star, style: .solid, textColor: buttonYellow, size: .init(width: 16, height: 16)), size: 16, padding: 0, length: 5)
        
        descriptionText = textBox(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi elit diam, feugiat eget odio in, laoreet ornare mauris. Donec vitae ipsum maximus, iaculis tortor quis, vehicula lacus. Fusce imperdiet enim quis auctor aliquet. Vestibulum quam elit, blandit nec diam vitae, aliquet auctor nibh. Donec magna justo, hendrerit quis fermentum et, tincidunt nec eros. Cras sit amet urna vel velit consequat posuere. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.", align: .center, y: infoPane.subviews.last!.frame.maxY+12)
        
        infoPane.addSubview(descriptionText)
        
        secondaryPane = UIView.init(frame: CGRect.init(x: 0, y: infoPane.subviews.last!.frame.maxY+24, width: _screenWidth, height: 0))
        
        postedByLabel = titleLabel(frame: CGRect.init(x: screenXCenter-labelWidth/2, y: 6, width: labelWidth, height: labelHeight), text: "LOCATION POSTED BY: CHRISTIAN BEBIS", type: 1, align: .center)
        let postedByWidth = postedByLabel.attributedText?.width(withConstrainedHeight: postedByLabel.frame.height)
        
        let calcX = (_screenWidth/2)-(postedByWidth ?? _screenWidth/2)/2
        let topPostedBy = drawLine(x: calcX, y: 0, width: postedByWidth ?? _screenWidth/2)
        secondaryPane.addSubview(topPostedBy)
        secondaryPane.addSubview(postedByLabel)
        let bottomPostedBy = drawLine(x: calcX, y: secondaryPane.subviews.last!.frame.maxY+6, width: postedByWidth ?? _screenWidth/2)
        secondaryPane.addSubview(bottomPostedBy)
        
        let buttonHeight: CGFloat = 40
        let buttonWidth: CGFloat = _screenWidth*(4/9)
        let buttonPadding: CGFloat = 6

        directionsBtn = ovalBtn(frame: CGRect.init(x: screenXCenter-buttonWidth/2, y: secondaryPane.subviews.last!.frame.maxY+30, width: buttonWidth, height: buttonHeight), text: "DIRECTIONS", colour: buttonYellow, type: 0)
        secondaryPane.addSubview(directionsBtn)
        
        spaceTypeLabel = extraInfoSection(view: secondaryPane, labelText: "SPACE", typeText: "COLLABORATIVE", moreInfoPage: #selector(pushSpaceTypeVC), includeMoreInfo: true)
        spaceMoreInfoIcon = addMoreInfoIcon(view: secondaryPane, typeLabel: spaceTypeLabel, moreInfoPage: #selector(pushSpaceTypeVC))
        secondaryPane.addSubview(spaceTypeLabel)
        secondaryPane.addSubview(spaceMoreInfoIcon)
        
        equipmentTypeLabel = extraInfoSection(view: secondaryPane, labelText: "AVAILABLE EQUIPMENT", typeText: "NOT AVAILABLE AT THIS LOCATION", moreInfoPage: #selector(pushEquipmentListVC), includeMoreInfo: false)
//        equipmentMoreInfoIcon = addMoreInfoIcon(view: secondaryPane, typeLabel: equipmentTypeLabel, moreInfoPage: #selector(pushEquipmentListVC))
        secondaryPane.addSubview(equipmentTypeLabel)
//        secondaryPane.addSubview(equipmentMoreInfoIcon)
        
        accessibilityTypeLabel = extraInfoSection(view: secondaryPane, labelText: "ACCESSIBILITY", typeText: "EASY ACCESS FOR ALL", moreInfoPage: #selector(pushAccessibilityTypesVC), includeMoreInfo: true)
        accessibilityMoreInfoIcon = addMoreInfoIcon(view: secondaryPane, typeLabel: accessibilityTypeLabel, moreInfoPage: #selector(pushAccessibilityTypesVC))
        secondaryPane.addSubview(accessibilityTypeLabel)
        secondaryPane.addSubview(accessibilityMoreInfoIcon)
        
        permitTypeLabel = extraInfoSection(view: secondaryPane, labelText: "PERMIT", typeText: "REQUIRED", moreInfoPage: #selector(pushPermitTypeVC), includeMoreInfo: false)
//        permitMoreInfoIcon = addMoreInfoIcon(view: secondaryPane, typeLabel: permitTypeLabel, moreInfoPage: #selector(pushPermitTypeVC))
        secondaryPane.addSubview(permitTypeLabel)
//        secondaryPane.addSubview(permitMoreInfoIcon)
        
        secondaryPane.addSubview(extraInfoSection(view: secondaryPane, labelText: "CONTACT", typeText: "", moreInfoPage: #selector(doNothing), includeMoreInfo: false))

        let contactButtonHeight: CGFloat = 32
        let contactButtonWidth = _screenWidth*(5/9)
        contactStudioGoBtn = ovalBtn(frame: CGRect.init(x: centerView(width: contactButtonWidth), y: secondaryPane.subviews.last!.frame.maxY, width: contactButtonWidth, height: contactButtonHeight), text: "CONTACT STUDIOGO", colour: buttonYellow, type: 6)
        secondaryPane.addSubview(contactStudioGoBtn)
        contactPosterBtn = ovalBtn(frame: CGRect.init(x: centerView(width: contactButtonWidth), y: secondaryPane.subviews.last!.frame.maxY+12, width: contactButtonWidth, height: contactButtonHeight), text: "MESSAGE CHRISTIAN BEBIS", colour: buttonYellow, type: 6)
        secondaryPane.addSubview(contactPosterBtn)
        
        let haveYouBeenHereLabel = titleLabel(frame: CGRect.init(x: screenXCenter-labelWidth/2, y: secondaryPane.subviews.last!.frame.maxY+30, width: labelWidth, height: labelHeight), text: "HAVE YOU BEEN HERE?", type: 1, align: .center)
        secondaryPane.addSubview(haveYouBeenHereLabel)

//        let buttonHeight: CGFloat = 20
//        let buttonWidth: CGFloat = labelWidth
//        let buttonPadding: CGFloat = 6
        checkInBtn = ovalBtn(frame: CGRect.init(x: screenXCenter-contactButtonWidth/2, y: secondaryPane.subviews.last!.frame.maxY+8, width: contactButtonWidth/2-buttonPadding, height: 20), text: "CHECK IN", colour: studioGrey, type: 5)
        reviewBtn = ovalBtn(frame: CGRect.init(x: screenXCenter+buttonPadding, y: secondaryPane.subviews.last!.frame.maxY+8, width: contactButtonWidth/2-buttonPadding, height: 20), text: "REVIEW", colour: studioGrey, type: 5)
        secondaryPane.addSubview(checkInBtn)
        secondaryPane.addSubview(reviewBtn)

        viewAllBtn = ovalBtn(frame: CGRect.init(x: centerView(width: contactButtonWidth), y: secondaryPane.subviews.last!.frame.maxY+8, width: contactButtonWidth, height: 20), text: "36 REVIEWS - VIEW ALL", colour: studioGrey, type: 5)
        secondaryPane.addSubview(viewAllBtn)
        
        secondaryPane.frame = CGRect.init(x: secondaryPane.frame.minX, y: secondaryPane.frame.minY, width: secondaryPane.frame.width, height: secondaryPane.subviews.last!.frame.maxY)
        infoPane.addSubview(secondaryPane)
        
        infoPane.frame = CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: infoPane.subviews.last!.frame.maxY+viewPadding)

        scrollView.addSubview(infoPane)
    }
    
    func drawSymbols(view: UIView, symbolImage: UIImage, size: CGFloat, padding: CGFloat, length: Int) -> Array<UIImageView> {
        var icons: Array<UIImageView> = []
        let y = view.subviews.last!.frame.maxY+1+padding
        for i in 1...length {
            let xPos:CGFloat = (CGFloat(i-3)*size)-(size/2)
            let diff = 5-length
            let offset = CGFloat(diff)*(size/2)
//            var xPos:CGFloat = 0
//            if (i%2 == 1){
//                xPos = (CGFloat(i-(length/2))*size)-(size/2)
//            }
            icons.append(UIImageView(frame: CGRect.init(x: screenXCenter+xPos+offset, y: y, width: size, height: size)))
            icons[i-1].image = symbolImage
            view.addSubview(icons[i-1])
        }
        return icons
    }
    
    func drawLine(x: CGFloat, y: CGFloat, width: CGFloat) -> UIView {
        let line = UIView.init(frame: .init(x: x, y: y, width: width, height: 1))
        line.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return line
    }
    
    func drawShortLine(y: CGFloat) -> UIView {
        let line = UIView.init(frame: .init(x: centerView(width: _screenWidth/16), y: y, width: _screenWidth/16, height: 4))
        line.backgroundColor = buttonYellow
        return line
    }
    
    func moreInfoTableView() {
        let moreInfoTableView = UITableView(frame: CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: 0), style: UITableView.Style.plain)
        
        moreInfoTableView.layoutMargins = UIEdgeInsets.zero
        moreInfoTableView.separatorInset = UIEdgeInsets.zero
        moreInfoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        moreInfoTableView.isScrollEnabled = false
        
        moreInfoTableView.addSubview(createCell(text: "AVAILABLE EQUIPMENT", y: 0))
        moreInfoTableView.addSubview(createCell(text: "CONTACT", y: moreInfoTableView.subviews.last!.frame.maxY))
        moreInfoTableView.addSubview(createCell(text: "DIRECTIONS", y: moreInfoTableView.subviews.last!.frame.maxY))
        
        moreInfoTableView.separatorColor = .lightGray
        moreInfoTableView.separatorStyle = .singleLine
        
        moreInfoTableView.frame = CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: moreInfoTableView.subviews.last!.frame.maxY)
        let px = 1 / UIScreen.main.scale
        let line = UIView(frame: CGRect.init(x: 0, y: 0, width: moreInfoTableView.frame.size.width, height: px))
        moreInfoTableView.tableHeaderView = line
        line.backgroundColor = moreInfoTableView.separatorColor
        scrollView.addSubview(moreInfoTableView)
    }
    
    func createCell(text: String, y: CGFloat) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "moreInfoMenu")
        cell.frame = CGRect.init(x: 0, y: y, width: Screen.width, height: cell.frame.height)
        print(cell.frame.height)
        let cellTitle = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Screen.width, height: cell.frame.height))
        
        cellTitle.attributedText = attributeText(type: 2, text: text)
        cellTitle.textAlignment = .center
        cell.contentView.addSubview(cellTitle)
        
        let accessorySize: CGFloat = 26
        let accessorySizePadding: CGFloat = 6
        let cellImage = UIImage.fontAwesomeIcon(name: .chevronCircleRight, style: .solid, textColor: .lightGray, size: CGSize(width: accessorySize, height: accessorySize))
        let cellImageView = UIImageView.init(image: cellImage)
        cellImageView.frame = CGRect.init(x: Screen.width-accessorySize-accessorySizePadding, y: (cell.contentView.frame.height/2)-(accessorySize/2), width: accessorySize, height: accessorySize)
        cellImageView.contentMode = .scaleAspectFill
        cellImageView.clipsToBounds = true
        cellImageView.layer.masksToBounds = true
        cell.contentView.addSubview(cellImageView)
        //        cell.accessoryType = .disclosureIndicator
        //        cell.preservesSuperviewLayoutMargins = false
        //        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    func iconBtn (frame: CGRect, icon: String, style: FontAwesomeStyle) -> UIButton {
        let btn = UIButton.init(frame: frame)
        btn.titleLabel?.font = UIFont.fontAwesome(ofSize: btn.frame.width-4, style: style)
        btn.setTitle(icon, for: .normal)
        btn.setTitleColor(studioGrey, for: .normal)
        return btn
    }
    
    func ovalBtn(frame: CGRect, text: String, colour: UIColor, type: Int) -> UIButton {
        let buttonHeight: CGFloat = frame.height
        let buttonCornerRadius: CGFloat = buttonHeight/2
        
        let btn = UIButton.init(frame: frame)
        
        btn.setAttributedTitle(attributeText(type: type, text: text), for: .normal)
        btn.backgroundColor = colour
        btn.layer.cornerRadius = buttonCornerRadius
        
        //btns disabled
//        btn.backgroundColor = studioGrey
        btn.layer.opacity = 0.5
        if (colour == studioGrey) {
            btn.layer.opacity = 0.2
        }
        btn.isUserInteractionEnabled = false
        
        //        btn.titleLabel?.text = text
        return btn
    }
    
    func titleLabel(frame: CGRect, text: String, type: Int, align: NSTextAlignment) -> UILabel {
        let label = UILabel.init(frame: frame)
        
        label.attributedText = attributeText(type: type, text: text)
        label.textAlignment = align
        
        return label
    }
    
    func textBox(text: String, align: NSTextAlignment, y: CGFloat) -> UILabel {
        
        let width = _screenWidth*(17/20)
        let x = screenXCenter-width/2
        let attrText = NSAttributedString(string: text, attributes: (GlobalConstants.TextBoxInfoAttributes as! [NSAttributedString.Key : Any]))
        let frameHeight = attrText.height(withConstrainedWidth: width)

        let label = UILabel.init(frame: CGRect(x: x, y: y, width: width, height: frameHeight))
        
        label.numberOfLines = 0
        label.attributedText = attrText
        label.textAlignment = align
        
        return label
    }
    
    func populateView(location: Location) -> UIView {
        locationTypeLabel.attributedText = attributeText(type: 1, text: (location.isPrivate) ? "Private Location" : "Public Location")
        locationLabel.attributedText = attributeText(type: 3, text: location.locationTitle)
        addressLabel.attributedText = attributeText(type: 1, text: location.streetAddress + ", " + location.city + ", " + location.province)
        
        let priceIconsY = priceIcons[0].frame.minY
        print("print",priceIconsY)
        for i in 1...(priceIcons.count) {
//            infoPane.willRemoveSubview(priceIcons[i-1])
            priceIcons[i-1].removeFromSuperview()
        }
        print("count",priceIcons.count,"/",location.cost.count)
    
        priceIcons = drawSymbols(view: infoPane, symbolImage: UIImage.fontAwesomeIcon(name: .dollarSign, style: .solid, textColor: studioGrey, size: .init(width: 16, height: 16)), size: 16, padding: 8, length: location.cost.count)
        
        for i in 1...(priceIcons.count) {
            priceIcons[i-1].frame = CGRect.init(x: priceIcons[i-1].frame.minX, y: priceIconsY, width: priceIcons[i-1].frame.width, height: priceIcons[i-1].frame.height)
            infoPane.sendSubviewToBack(priceIcons[i-1])
        }
        
        descriptionText.attributedText = NSAttributedString(string: location.description, attributes: (GlobalConstants.TextBoxInfoAttributes as! [NSAttributedString.Key : Any]))
        
        spaceTypeLabel.attributedText = attributeText(type: 1, text: location.spaceType)
        equipmentTypeLabel.attributedText = attributeText(type: 1, text: location.equipment)
        accessibilityTypeLabel.attributedText = attributeText(type: 1, text: location.accessibility)
        permitTypeLabel.attributedText = attributeText(type: 2, text: ((location.hasPermit) ? "Required" : "None"))

        updateViewY()
        updateElementsX()
        
        if (location.images.count != 0) {
            image = UIImage.init(named: location.images[0])!
            imagePane.image = image
        }
        
        return self
    }
    
    func updateViewY() {
        scrollView.willRemoveSubview(infoPane)

        let newHeight = descriptionText.attributedText?.height(withConstrainedWidth: descriptionText.frame.width)
        descriptionText.frame = CGRect(x: descriptionText.frame.minX, y: starIcons[0].frame.maxY+12, width: descriptionText.frame.width, height: newHeight ?? 0)
        
        secondaryPane.frame = CGRect.init(x: secondaryPane.frame.minX, y: descriptionText.frame.maxY+24, width: secondaryPane.frame.width, height: secondaryPane.frame.height)
        
        infoPane.frame = CGRect.init(x: infoPane.frame.minX, y: infoPane.frame.minY, width: infoPane.frame.width, height: infoPane.subviews.last!.frame.maxY+viewPadding)
        print(secondaryPane.subviews.last!.frame.maxY)
        print(infoPane.subviews.last!.frame.maxY)
        print(scrollView.subviews.last!.frame.maxY)
        scrollView.addSubview(infoPane)
        scrollView.contentSize.height = scrollView.subviews.last!.frame.maxY
        print(scrollView.subviews)

    }
    
    func updateElementsX() {
        let moreInfoIconSize:CGFloat = 10
        let labelHeight:CGFloat = 10

        var x = calcX(label: spaceTypeLabel, includeIcon: true)
        spaceTypeLabel.frame = updateFrameX(frame: spaceTypeLabel.frame, x: x)
        var iconX = xForIcon(label:spaceTypeLabel) + moreInfoIconSize
        spaceMoreInfoIcon.frame = updateFrameX(frame: spaceMoreInfoIcon.frame, x: iconX)
        
        x = calcX(label: equipmentTypeLabel, includeIcon: false)
        equipmentTypeLabel.frame = updateFrameX(frame: equipmentTypeLabel.frame, x: x)
//        iconX = xForIcon(label:equipmentTypeLabel) + moreInfoIconSize
//        equipmentMoreInfoIcon.frame = updateFrameX(frame: equipmentMoreInfoIcon.frame, x: iconX)
        
        x = calcX(label: accessibilityTypeLabel, includeIcon: true)
        accessibilityTypeLabel.frame = updateFrameX(frame: accessibilityTypeLabel.frame, x: x)
        iconX = xForIcon(label:accessibilityTypeLabel) + moreInfoIconSize
        accessibilityMoreInfoIcon.frame = updateFrameX(frame: accessibilityMoreInfoIcon.frame, x: iconX)
        
        x = calcX(label: permitTypeLabel, includeIcon: false)
        permitTypeLabel.frame = updateFrameX(frame: permitTypeLabel.frame, x: x)
//        iconX = xForIcon(label:permitTypeLabel) + moreInfoIconSize
//        permitMoreInfoIcon.frame = updateFrameX(frame: permitMoreInfoIcon.frame, x: iconX)
    }
    
    func updateFrameX(frame: CGRect, x: CGFloat) -> CGRect {
        return CGRect.init(x: x, y: frame.minY, width: frame.width, height: frame.height)
    }
    
    func calcX(label: UILabel, includeIcon: Bool) -> CGFloat {
        var moreInfoIconSize:CGFloat = 0
        if (includeIcon) {
            moreInfoIconSize = 10
        }

        return screenXCenter - (label.frame.width/2) - moreInfoIconSize
    }
    
    func xForIcon(label:UILabel ) -> CGFloat {
        let width:CGFloat = label.attributedText?.width(withConstrainedHeight: 10) ?? 40
        return screenXCenter + width/2 - 10
    }
    
    func attributeText(type: Int, text: String) -> NSAttributedString {
        let attrType = type==1 ? GlobalConstants.SmallLocationInfoAttributes : type==2 ?  GlobalConstants.RegularLocationInfoAttributes : type==3 ? GlobalConstants.LargeLocationInfoAttributes : type==4 ? GlobalConstants.SubHeadingLocationInfoAttributes : type==5 ? GlobalConstants.SmallBtnLocationInfoAttr : type==6 ? GlobalConstants.RegularBtnLocationInfoAttr : GlobalConstants.BtnLocationInfoAttributes
        return NSAttributedString(string: text.uppercased(), attributes: (attrType as! [NSAttributedString.Key : Any]))
    }
    
    func centerView(width: CGFloat) -> CGFloat {
        return _screenWidth/2 - width/2
    }
    
    func extraInfoSection(view: UIView, labelText: String, typeText: String, moreInfoPage: Selector, includeMoreInfo: Bool) -> UILabel {
        let labelWidth = Screen.width*(2/3)
        let largeLabelHeight: CGFloat = 20
        let labelHeight: CGFloat = 10
        
        let line = drawLine(x: centerView(width: _screenWidth/2), y: view.subviews.last!.frame.maxY+24, width: _screenWidth/2)
        view.addSubview(line)
        
        let label = titleLabel(frame: CGRect.init(x: screenXCenter-_screenWidth/2, y: view.subviews.last!.frame.maxY+12, width: _screenWidth, height: largeLabelHeight), text: labelText, type: 4, align: .center)
        view.addSubview(label)
        
        let shortLine = drawShortLine(y: view.subviews.last!.frame.maxY+4)
        view.addSubview(shortLine)
        
        var moreInfoIconSize:CGFloat = 0
        if (includeMoreInfo) {
            print("Heeeyyy")
            moreInfoIconSize = 10
        }
        let typeLabel = titleLabel(frame: CGRect.init(x: screenXCenter-labelWidth/2 - moreInfoIconSize, y: view.subviews.last!.frame.maxY+8, width: labelWidth, height: labelHeight), text: typeText, type: 1, align: .center)
        
//        view.addSubviewcreateView(typeLabel)
        
        return typeLabel
    }
    
    func addMoreInfoIcon(view: UIView, typeLabel: UILabel, moreInfoPage: Selector) -> UIButton {
        let labelHeight: CGFloat = 10
        let typeLabelWidth = (typeLabel.attributedText?.width(withConstrainedHeight: labelHeight))!
        let moreInfoIconSize:CGFloat = 10
        
        let moreInfoIconX:CGFloat = (screenXCenter+(typeLabelWidth/2)-moreInfoIconSize)
        let moreInfoIcon = UIButton(frame: CGRect.init(x: moreInfoIconX+moreInfoIconSize-moreInfoIconSize/2, y: view.subviews.last!.frame.maxY+8-moreInfoIconSize/2, width: moreInfoIconSize*2, height: moreInfoIconSize*2))
        moreInfoIcon.titleLabel?.font = UIFont.fontAwesome(ofSize: moreInfoIconSize, style: .solid)
        moreInfoIcon.setTitle(String.fontAwesomeIcon(name: .questionCircle), for: .normal)
        moreInfoIcon.setTitleColor(studioGrey, for: .normal)
        
        moreInfoIcon.addTarget(self, action: moreInfoPage, for: .touchUpInside)
//        view.addSubview(moreInfoIcon)
        
        return moreInfoIcon
    }
    
    @objc func pushSpaceTypeVC(action: Selector) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushSpaceTypeVC"), object: nil)
    }
    
    @objc func pushAccessibilityTypesVC(action: Selector) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushAccessibilityTypesVC"), object: nil)
    }
    
    @objc func pushEquipmentListVC(action: Selector) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushEquipmentListVC"), object: nil)
    }
    
    @objc func pushPermitTypeVC(action: Selector) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushPermitTypeVC"), object: nil)
    }
    
    @objc func doNothing() {
        
    }
}
