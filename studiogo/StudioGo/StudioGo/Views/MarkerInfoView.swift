//
//  MarkerInfoView.swift
//  StudioGo
//
//  Created by Owner on 2/18/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit
import SwiftyJSON

class MarkerInfoView: UIView {
    
    private let _screenWidth = GlobalConstants.screenWidth
    private let _screenHeight = GlobalConstants.screenHeight
    
    let markerInfoView = self
    
    var markerInfoImage = UIImage.fontAwesomeIcon(name: .adn, style: .brands, textColor: .red, size: CGSize.init(width: 64, height: 64))
    let markerInfoImageView = UIImageView()
    
    let markerInfoPane = UIView()
    
    let markerInfoTitlePane = UIView()
    let markerInfoLocationPane = UIView()
    let markerInfoSpaceTypePane = UIView()
    let markerInfoPermitPane = UIView()
    let markerInfoAccessibilityPane = UIView()
    let markerInfoPricePane = UIView()
    
    let markerInfoTitle = UILabel()
    let markerInfoLocation = UILabel()
    let markerInfoSpaceType = UILabel()
    let markerInfoPermit = UILabel()
    let markerInfoAccessibility = UILabel()
    let markerInfoPrice = UILabel()
    
    func createView() -> UIView {
        self.frame = CGRect(x: (_screenWidth/2)-((_screenWidth-20)/2), y: _screenHeight, width: _screenWidth-20, height: 128)
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        //        let markerInfoImage = UIImage.fontAwesomeIcon(name: .adn, style: .brands, textColor: .red, size: CGSize.init(width: 64, height: 64))
        //        let markerInfoImageView = UIImageView(frame: CGRect.init(x: 8, y: 8, width: (markerInfoView.bounds.width/3)-12, height: markerInfoView.bounds.height-16))
        markerInfoImageView.frame = CGRect.init(x: 12, y: 12, width: self.bounds.height-24, height: self.bounds.height-24)
        markerInfoImageView.image = markerInfoImage
        markerInfoImageView.contentMode = .scaleAspectFill
        markerInfoImageView.clipsToBounds = true
        markerInfoImageView.layer.masksToBounds = true;
        markerInfoImageView.layer.cornerRadius = 20;
        self.addSubview(markerInfoImageView)
        
        markerInfoPane.frame.size = CGSize.init(width: (self.bounds.width*(2/3))-36, height: self.bounds.height-16)
        
        markerInfoPane.frame = CGRect.init(x: 24+markerInfoImageView.bounds.width, y: 8, width: ((self.bounds.width/3)*2)-36, height: self.bounds.height-16)
        //
        markerInfoTitlePane.frame = CGRect.init(x: 0, y: 0, width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(2/7))
        markerInfoLocationPane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(2/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        markerInfoSpaceTypePane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(3/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        markerInfoPermitPane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(4/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        markerInfoAccessibilityPane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(5/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        markerInfoPricePane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(6/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        
        markerInfoLocationPane.bounds = markerInfoLocationPane.bounds.insetBy(dx: 2,dy: 2);
        markerInfoSpaceTypePane.bounds = markerInfoSpaceTypePane.bounds.insetBy(dx: 2,dy: 2);
        markerInfoPermitPane.bounds = markerInfoPermitPane.bounds.insetBy(dx: 2,dy: 2);
        markerInfoAccessibilityPane.bounds = markerInfoAccessibilityPane.bounds.insetBy(dx: 2,dy: 2);
        markerInfoPricePane.bounds = markerInfoPricePane.bounds.insetBy(dx: 2,dy: 2);

        //        markerInfoTitlePane.backgroundColor = .red
        //        markerInfoLocationPane.backgroundColor = .blue
        //        markerInfoPricePane.backgroundColor = .red
        //        markerInfoPermitPane.backgroundColor = .blue
        //        markerInfoWebsitePane.backgroundColor = .red
        //        markerInfoContactPane.backgroundColor = .blue
        
        markerInfoTitle.frame = CGRect.init(x:0, y:0, width: markerInfoTitlePane.bounds.width, height: markerInfoTitlePane.bounds.height)
        markerInfoLocation.frame = CGRect.init(x:0, y:0, width: markerInfoLocationPane.bounds.width, height: markerInfoLocationPane.bounds.height)
        markerInfoSpaceType.frame = CGRect.init(x:0, y:0, width: markerInfoSpaceTypePane.bounds.width, height: markerInfoSpaceTypePane.bounds.height)
        markerInfoPermit.frame = CGRect.init(x:0, y:0, width: markerInfoPermitPane.bounds.width, height: markerInfoPermitPane.bounds.height)
        markerInfoAccessibility.frame = CGRect.init(x:0, y:0, width: markerInfoAccessibilityPane.bounds.width, height: markerInfoAccessibilityPane.bounds.height)
        markerInfoPrice.frame = CGRect.init(x:0, y:0, width: markerInfoPricePane.bounds.width, height: markerInfoPricePane.bounds.height)
        
//        markerInfoTitle.attriext = "GRAFFITI ALLEY"
        markerInfoTitle.textAlignment = .left
        markerInfoTitle.textColor = .black
        markerInfoTitle.adjustsFontSizeToFitWidth = true;
        markerInfoTitle.numberOfLines = 2;
        markerInfoTitlePane.addSubview(markerInfoTitle)
        
//        markerInfoLocation.text = "LOCATION: PUBLIC"
        markerInfoLocation.textAlignment = .left
        markerInfoLocation.textColor = .black
        markerInfoLocation.adjustsFontSizeToFitWidth = true;
        markerInfoLocation.numberOfLines = 0;
        markerInfoLocationPane.addSubview(markerInfoLocation)
        
        //        markerInfoPrice.text = "PRICE: FREE"
        markerInfoSpaceType.textAlignment = .left
        markerInfoSpaceType.textColor = .black
        markerInfoSpaceType.adjustsFontSizeToFitWidth = true;
        markerInfoSpaceType.numberOfLines = 0;
        markerInfoSpaceTypePane.addSubview(markerInfoSpaceType)
        
//        markerInfoPermit.text = "PERMIT: NO"
        markerInfoPermit.textAlignment = .left
        markerInfoPermit.textColor = .black
        markerInfoPermit.adjustsFontSizeToFitWidth = true;
        markerInfoPermit.numberOfLines = 0;
        markerInfoPermitPane.addSubview(markerInfoPermit)
        
//        markerInfoWebsite.text = "WEBSITE: WWW.ALLEY.COM"
        markerInfoAccessibility.textAlignment = .left
        markerInfoAccessibility.textColor = .black
        markerInfoAccessibility.adjustsFontSizeToFitWidth = true;
        markerInfoAccessibility.numberOfLines = 0;
        markerInfoAccessibilityPane.addSubview(markerInfoAccessibility)
        
        //        markerInfoPrice.text = "PRICE: FREE"
        markerInfoPrice.textAlignment = .left
        markerInfoPrice.textColor = .black
        markerInfoPrice.adjustsFontSizeToFitWidth = true;
        markerInfoPrice.numberOfLines = 0;
        markerInfoPricePane.addSubview(markerInfoPrice)
        
        markerInfoPane.addSubview(markerInfoTitlePane)
        markerInfoPane.addSubview(markerInfoLocationPane)
        markerInfoPane.addSubview(markerInfoSpaceTypePane)
        markerInfoPane.addSubview(markerInfoPermitPane)
        markerInfoPane.addSubview(markerInfoAccessibilityPane)
        markerInfoPane.addSubview(markerInfoPricePane)
        
        self.addSubview(markerInfoPane)
        
        return self
    }
    
    func updateView(location: Location) {
        
        
        
        markerInfoTitle.attributedText = attributeText(type: 1, text: location.locationTitle.uppercased())
        markerInfoLocation.attributedText = attributeText(type: 2, text: "LOCATION: " + (location.isPrivate ? "PRIVATE" : "PUBLIC"))
        markerInfoSpaceType.attributedText = attributeText(type: 2, text: "SPACE: " + (location.spaceType))
        markerInfoPermit.attributedText = attributeText(type: 2, text: "PERMIT: " + (location.hasPermit ? "REQUIRED" : "NONE"))
        markerInfoAccessibility.attributedText = attributeText(type: 2, text: "ACCESSIBILE: " + (location.accessibility))
        markerInfoPrice.attributedText = attributeText(type: 2, text: "PRICE: " + location.cost.uppercased())

        if (location.images.count != 0) {
            print("IMAGES")
            markerInfoImage = UIImage.init(named: location.images[0])!
            markerInfoImageView.image = markerInfoImage
        }
        
    }
    
    func cutUrl(url: String) -> String {
        if (url.contains("/")) {
            return String(url.split(separator: "/", maxSplits: 2, omittingEmptySubsequences: true)[1])
        }
        return url
    }
    
    func attributeText(type: Int, text: String) -> NSAttributedString {
        let attrType = type==1 ? GlobalConstants.MarkerInfoTitleAttributes : GlobalConstants.MarkerInfoAttributes
        return NSAttributedString(string: text.uppercased(), attributes: (attrType as! [NSAttributedString.Key : Any]))
    }
}
