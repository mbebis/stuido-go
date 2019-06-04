//
//  MainViewController.swift
//  StudioGo
//
//  Created by Owner on 1/30/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit
import FontAwesome_swift

enum Screen {
    static let width: CGFloat = UIScreen.main.bounds.width
    static let height: CGFloat = UIScreen.main.bounds.height
}

class MainViewController: UITabBarController {
    
    let layerGradient = CAGradientLayer()

    let studioYellowLight = UIColor.init(red: 254/255, green: 232/255, blue: 13/255, alpha: 1)
    let studioYellowDark = UIColor.init(red: 237/255, green: 196/255, blue: 41/255, alpha: 1)
    let studioYellow = UIColor.init(red: 237/255, green: 200/255, blue: 39/255, alpha: 1)
    let studioPink = UIColor.init(red: 240/255, green: 89/255, blue: 153/255, alpha: 1)

    let iconSize = CGSize.init(width: 48, height: 43.2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapViewController = MapViewController()
        
        mapViewController.tabBarItem.image = UIImage.init(named: "PinIcon")
        mapViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        
//        UITabBarItem.appearance()
        let mediaViewController = MediaViewController()
                mediaViewController.tabBarItem.image = UIImage.fontAwesomeIcon(name: .playCircle, style: .regular, textColor: studioPink, size: iconSize)
        mediaViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)

        let listViewControllers = ListViewController()
        listViewControllers.tabBarItem.image = UIImage.fontAwesomeIcon(name: .envelope, style: .regular, textColor: studioPink, size: iconSize)
        listViewControllers.tabBarItem.imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)

       
        let viewControllerList = [ mapViewController, mediaViewController, listViewControllers ]
        viewControllers = viewControllerList.map { MapNavigationController(rootViewController: $0)}
        tabBarColour()
        tabbarHeight()
//        self.tabBar.barStyle(UIBarStyle.default)
//        view.addSubview(textField)
//        view.setNeedsUpdateConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        //UITabBar Height
        var tabFrame: CGRect = self.tabBar.frame
        tabFrame.size.height = 60
        tabFrame.origin.y = self.view.frame.size.height - 60
        self.tabBar.frame = tabFrame
    }
    
    override func updateViewConstraints() {
        textFieldConstraints()
        super.updateViewConstraints()
    }
    
    func tabBarColour() {
        self.tabBar.unselectedItemTintColor = .white
        self.tabBar.tintColor = studioPink
        self.tabBar.barTintColor = studioYellow
        self.tabBar.backgroundColor = studioYellow
        self.tabBar.isTranslucent = false
    }
    
    func tabbarHeight() {
        let kBarHeight = CGSize.init(width: self.tabBar.itemWidth, height: 60)
        self.tabBar.sizeThatFits(kBarHeight)
        
    }
    
    func textFieldConstraints() {
        // Center Text Field Relative to Page View
        NSLayoutConstraint(
            item: textField,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
            .isActive = true
        
        // Set Text Field Width to be 80% of the Width of the Page View
        NSLayoutConstraint(
            item: textField,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.8,
            constant: 0.0)
            .isActive = true
        
        // Set Text Field Y Position 10% Down From the Top of the Page View
        NSLayoutConstraint(
            item: textField,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 0.1,
            constant: 0.0)
            .isActive = true
    }

    lazy var textField: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        
        return view
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
