//
//  ProfileView.swift
//  StudioGo
//
//  Created by Owner on 8/19/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    let imageView:UIImageView = UIImageView.init()
    
    let popButton:UIButton = UIButton.init()
    
    init() {
        super.init(frame: CGRect.init(x: 0, y: 0, width: Screen.width, height: Screen.height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() -> UIView {
        
        imageView.frame = CGRect.init(x: self.frame.minX, y: self.frame.minY-40, width: self.frame.width, height: self.frame.height)
        imageView.image = UIImage(named: "ProfilePage")
        
        popButton.frame = CGRect.init(x: 0, y: GlobalConstants.navBarHeight, width: 50, height: 70)
        //        popButton.backgroundColor = .black
        popButton.addTarget(self, action: #selector(popController), for: .touchUpInside)
        
        self.addSubview(imageView)
        self.addSubview(popButton)
        
        return self
    }
    
    @objc func popController() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "popProfileController"), object: nil)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
