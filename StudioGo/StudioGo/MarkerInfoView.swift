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
    
    private let _screenWidth = UIScreen.main.bounds.width
    private let _screenHeight = UIScreen.main.bounds.height
    
    let markerInfoView = self
    
    let markerInfoImage = UIImage.fontAwesomeIcon(name: .adn, style: .brands, textColor: .red, size: CGSize.init(width: 64, height: 64))
    let markerInfoImageView = UIImageView()
    
    let markerInfoPane = UIView()
    
    let markerInfoTitlePane = UIView()
    let markerInfoLocationPane = UIView()
    let markerInfoPricePane = UIView()
    let markerInfoPermitPane = UIView()
    let markerInfoWebsitePane = UIView()
    let markerInfoContactPane = UIView()
    
    let markerInfoTitle = UILabel()
    let markerInfoLocation = UILabel()
    let markerInfoPrice = UILabel()
    let markerInfoPermit = UILabel()
    let markerInfoWebsite = UILabel()
    let markerInfoContact = UILabel()
    
    func createView() -> UIView {
        self.frame = CGRect(x: (_screenWidth/2)-((_screenWidth-20)/2), y: _screenHeight, width: _screenWidth-20, height: 128)
        self.backgroundColor = .white
        //        let markerInfoImage = UIImage.fontAwesomeIcon(name: .adn, style: .brands, textColor: .red, size: CGSize.init(width: 64, height: 64))
        //        let markerInfoImageView = UIImageView(frame: CGRect.init(x: 8, y: 8, width: (markerInfoView.bounds.width/3)-12, height: markerInfoView.bounds.height-16))
        markerInfoImageView.frame = CGRect.init(x: 8, y: 8, width: (self.bounds.width/3)-12, height: self.bounds.height-16)
        markerInfoImageView.image = markerInfoImage
        self.addSubview(markerInfoImageView)
        
        markerInfoPane.frame.size = CGSize.init(width: (self.bounds.width*(2/3))-36, height: self.bounds.height-16)
        
        markerInfoPane.frame = CGRect.init(x: 24+markerInfoImageView.bounds.width, y: 8, width: ((self.bounds.width/3)*2)-36, height: self.bounds.height-16)
        //
        markerInfoTitlePane.frame = CGRect.init(x: 0, y: 0, width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(2/7))
        markerInfoLocationPane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(2/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        markerInfoPricePane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(3/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        markerInfoPermitPane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(4/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        markerInfoWebsitePane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(5/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        markerInfoContactPane.frame = CGRect.init(x: 0, y: markerInfoPane.bounds.height*(6/7), width: markerInfoPane.bounds.width, height: markerInfoPane.bounds.height*(1/7))
        
        markerInfoLocationPane.bounds = markerInfoLocationPane.bounds.insetBy(dx: 2,dy: 2);
        markerInfoPricePane.bounds = markerInfoPricePane.bounds.insetBy(dx: 2,dy: 2);
        markerInfoPermitPane.bounds = markerInfoPermitPane.bounds.insetBy(dx: 2,dy: 2);
        markerInfoWebsitePane.bounds = markerInfoWebsitePane.bounds.insetBy(dx: 2,dy: 2);
        markerInfoContactPane.bounds = markerInfoContactPane.bounds.insetBy(dx: 2,dy: 2);
        
        //        markerInfoTitlePane.backgroundColor = .red
        //        markerInfoLocationPane.backgroundColor = .blue
        //        markerInfoPricePane.backgroundColor = .red
        //        markerInfoPermitPane.backgroundColor = .blue
        //        markerInfoWebsitePane.backgroundColor = .red
        //        markerInfoContactPane.backgroundColor = .blue
        
        markerInfoTitle.frame = CGRect.init(x:0, y:0, width: markerInfoTitlePane.bounds.width, height: markerInfoTitlePane.bounds.height)
        markerInfoLocation.frame = CGRect.init(x:0, y:0, width: markerInfoLocationPane.bounds.width, height: markerInfoLocationPane.bounds.height)
        markerInfoPrice.frame = CGRect.init(x:0, y:0, width: markerInfoPricePane.bounds.width, height: markerInfoPricePane.bounds.height)
        markerInfoPermit.frame = CGRect.init(x:0, y:0, width: markerInfoPermitPane.bounds.width, height: markerInfoPermitPane.bounds.height)
        markerInfoWebsite.frame = CGRect.init(x:0, y:0, width: markerInfoWebsitePane.bounds.width, height: markerInfoWebsitePane.bounds.height)
        markerInfoContact.frame = CGRect.init(x:0, y:0, width: markerInfoContactPane.bounds.width, height: markerInfoContactPane.bounds.height)
        
        markerInfoTitle.text = "GRAFFITI ALLEY"
        markerInfoTitle.textAlignment = .left
        markerInfoTitle.textColor = .black
        markerInfoTitle.adjustsFontSizeToFitWidth = true;
        markerInfoTitle.numberOfLines = 2;
        markerInfoTitlePane.addSubview(markerInfoTitle)
        
        markerInfoLocation.text = "LOCATION: PUBLIC"
        markerInfoLocation.textAlignment = .left
        markerInfoLocation.textColor = .black
        markerInfoLocation.adjustsFontSizeToFitWidth = true;
        markerInfoLocation.numberOfLines = 0;
        markerInfoLocationPane.addSubview(markerInfoLocation)
        
        
        markerInfoPrice.text = "PRICE: FREE"
        markerInfoPrice.textAlignment = .left
        markerInfoPrice.textColor = .black
        markerInfoPrice.adjustsFontSizeToFitWidth = true;
        markerInfoPrice.numberOfLines = 0;
        markerInfoPricePane.addSubview(markerInfoPrice)
        
        markerInfoPermit.text = "PERMIT: NO"
        markerInfoPermit.textAlignment = .left
        markerInfoPermit.textColor = .black
        markerInfoPermit.adjustsFontSizeToFitWidth = true;
        markerInfoPermit.numberOfLines = 0;
        markerInfoPermitPane.addSubview(markerInfoPermit)
        
        markerInfoWebsite.text = "WEBSITE: WWW.ALLEY.COM"
        markerInfoWebsite.textAlignment = .left
        markerInfoWebsite.textColor = .black
        markerInfoWebsite.adjustsFontSizeToFitWidth = true;
        markerInfoWebsite.numberOfLines = 0;
        markerInfoWebsitePane.addSubview(markerInfoWebsite)
        
        markerInfoContact.text = "CONTACT: N/A"
        markerInfoContact.textAlignment = .left
        markerInfoContact.textColor = .black
        markerInfoContact.adjustsFontSizeToFitWidth = true;
        markerInfoContact.numberOfLines = 0;
        markerInfoContactPane.addSubview(markerInfoContact)
        
        markerInfoPane.addSubview(markerInfoTitlePane)
        markerInfoPane.addSubview(markerInfoLocationPane)
        markerInfoPane.addSubview(markerInfoPricePane)
        markerInfoPane.addSubview(markerInfoPermitPane)
        markerInfoPane.addSubview(markerInfoWebsitePane)
        markerInfoPane.addSubview(markerInfoContactPane)
        
        self.addSubview(markerInfoPane)
        
        return self
    }
    
    func updateView(json: JSON) {
        
        markerInfoTitle.text = json["title"].stringValue.uppercased()
        markerInfoLocation.text = "LOCATION: "+json["location"].stringValue.uppercased()
        markerInfoPrice.text = "PRICE: "+json["cost"].stringValue.uppercased()
        markerInfoPermit.text = "PERMIT: "+json["permit"].stringValue.uppercased()
        markerInfoWebsite.text = "WEBSITE: "+cutUrl(url: json["website"].stringValue.lowercased())
        markerInfoContact.text = "CONTACT: "+json["contact"].stringValue.uppercased()
        
    }
    
    func cutUrl(url: String) -> String {
        return String(url.split(separator: "/", maxSplits: 2, omittingEmptySubsequences: true)[1])
    }
    
}
