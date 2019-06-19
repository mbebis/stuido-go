import UIKit

struct GlobalConstants {
    //  DEVICE CONSTANT
    
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
    
    static let attributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor(ciColor: .black),
        NSAttributedString.Key.font:lightFont
    ]
    static let whiteTextAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor(ciColor: .white),
        NSAttributedString.Key.font:regularFont
    ]
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
