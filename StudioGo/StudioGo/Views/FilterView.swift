//
//  FilterView.swift
//  StudioGo
//
//  Created by Owner on 7/11/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class FilterView: UIView {
    
    private let _screenWidth = GlobalConstants.screenWidth
    private let _screenHeight = GlobalConstants.screenHeight
    
    private let tabbarHeight:CGFloat = GlobalConstants.tabbarHeight
    private let navBarHeight:CGFloat = GlobalConstants.navBarHeight
    private let statusBarHeight:CGFloat = GlobalConstants.statusBarHeight
    
    private var searchBarWidth:CGFloat = 0
    private var searchBarHeight:CGFloat = 0
    
    private let singleLineHeight:CGFloat = 20
    private let padding:CGFloat = 12

    private let cityFieldObj = SearchBarView(placeholder: NSAttributedString(string: "TYPE CITY HERE", attributes: (GlobalConstants.blackTextLightAttr as! [NSAttributedString.Key : Any])))
    private var cityField = UITextField()
    
    private let distanceLabel = UILabel()
//   private  let distanceSlider = slider?
    
    private let isPrivateLabel = UILabel()
    private let isPrivateDropDownObj = DropDownView(items: ["PUBLIC OR PRIVATE", "PUBLIC", "PRIVATE"], addIcon: 0)
    private let typeLabel = UILabel()
    private let typeDropDownObj = DropDownView(items: ["Type", "Studio"], addIcon: 0)
    
    private let mediumLabel = UILabel()
    private let mediumDropDownObj = DropDownView(items: ["Medium", "Photography"], addIcon: 0)
    
    private let tagsLabel = UILabel()
    private let tagsField = UITextField()
    
    private let cancelButton = UIButton()
    private let applyButton = UIButton()
    
    init(searchBarWidth: CGFloat, searchBarHeight: CGFloat) {
        self.searchBarWidth = searchBarWidth
        self.searchBarHeight = searchBarHeight
        super.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() -> UIView {
        self.isHidden = true
        self.frame = CGRect.init(x: (_screenWidth-searchBarWidth)/2, y: padding+navBarHeight+statusBarHeight+searchBarHeight, width: searchBarWidth, height: _screenHeight-tabbarHeight-navBarHeight-statusBarHeight-searchBarHeight-padding*2)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        
        cityFieldObj.setFrame(frame: CGRect.init(x: padding, y: padding, width: self.frame.width-padding*2, height: singleLineHeight))
        cityFieldObj.setBackgroundColour(colour: GlobalConstants.studioLightGrey)
        cityFieldObj.setLeftViewImage(image: UIImage.fontAwesomeIcon(name: .mapPin, style: .solid, textColor: .white, size: CGSize.init(width: 20, height: 20)))

        cityField = cityFieldObj.setupView()
        
        self.addSubview(cityField)
        
        
        
        return self
    }
    
}
