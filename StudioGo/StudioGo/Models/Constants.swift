import UIKit

struct GlobalConstants {
    //  DEVICE CONSTANT
    static let tabbarHeight:CGFloat = 60
    static let navBarHeight:CGFloat = 72
    static let statusBarHeight = UIApplication.shared.statusBarFrame.height
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    //  COLOR CONSTANT
    
//    static let studioYellow = UIColor.init(red: 237/255, green: 200/255, blue: 39/255, alpha: 1)
    static let studioYellow = UIColor.init(red: 244/255, green: 194/255, blue: 23/255, alpha: 1)
    static let studioPink = UIColor.init(red: 240/255, green: 89/255, blue: 153/255, alpha: 1)
    static let studioGrey = UIColor.init(red: 70/255, green: 71/255, blue: 73/255, alpha: 1)
    static let studioLightGrey = UIColor.init(red: 238/255, green: 241/255, blue: 247/255, alpha: 1)

    //  FONT CONSTANT
    
    static let mediumFont:UIFont = UIFont(name: "Montserrat-SemiBold", size: 18)!
    static let regularFont:UIFont = UIFont(name: "Montserrat-SemiBold", size: 12)!
    static let lightFont:UIFont = UIFont(name: "Montserrat-Regular", size: 8)!
    
    //  label constants
    
    static let blackTextLightAttr: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.black,
        NSAttributedString.Key.font:lightFont
    ]
    static let greyTextLightAttr: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioGrey,
        NSAttributedString.Key.font:lightFont
    ]
    static let whiteTextLightAttr: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.white,
        NSAttributedString.Key.font:lightFont
    ]
    static let blackTextRegularAttr: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.black,
        NSAttributedString.Key.font:regularFont
    ]
    static let greyTextRegularAttr: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioGrey ,
        NSAttributedString.Key.font:regularFont
    ]
    static let whiteTextRegularAttr: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.white,
        NSAttributedString.Key.font:regularFont
    ]
    static let yellowTextAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioYellow,
        NSAttributedString.Key.font:regularFont
    ]
    static let whiteFilterAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.white,
        NSAttributedString.Key.font:regularFont
    ]
    static let blackFilterAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.black,
        NSAttributedString.Key.font:regularFont
    ]
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        
        for vw in view.subviews {
            vw.endEditing(true)
        }
    }
}
