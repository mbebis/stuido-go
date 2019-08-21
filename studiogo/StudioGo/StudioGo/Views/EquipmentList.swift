//
//  EquipmentList.swift
//  StudioGo
//
//  Created by Owner on 8/16/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class EquipmentList: UIView {

    let imageView:UIImageView = UIImageView.init()
    
    init() {
        super.init(frame: CGRect.init(x: 0, y: 0, width: Screen.width, height: Screen.height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() -> UIView {
        
        imageView.frame = self.frame
        imageView.image = UIImage(named: "EquipmentList")
        self.addSubview(imageView)
        
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
