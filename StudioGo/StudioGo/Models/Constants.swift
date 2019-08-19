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
    static let buttonYellow = UIColor.init(red: 239/255, green: 206/255, blue: 45/255, alpha: 1)
    static let studioPink = UIColor.init(red: 240/255, green: 89/255, blue: 153/255, alpha: 1)
    static let studioGrey = UIColor.init(red: 70/255, green: 71/255, blue: 73/255, alpha: 1)
    static let studioLightGrey = UIColor.init(red: 230/255, green: 231/255, blue: 232/255, alpha: 1)

    //  FONT CONSTANT
    
    static let mediumFont:UIFont = UIFont(name: "Montserrat-SemiBold", size: 18)!
    static let regularFont:UIFont = UIFont(name: "Montserrat-SemiBold", size: 12)!
    static let lightFont:UIFont = UIFont(name: "Montserrat-Regular", size: 8)!
    
    static let searchBarFont:UIFont = UIFont(name: "Montserrat-Regular", size: 16)!
    static let markerInfoTitleFont:UIFont = UIFont(name: "Montserrat-Bold", size: 16)!

    static let smallLocationFont:UIFont = UIFont(name: "Montserrat-Medium", size: 8)!
    static let regularLocationFont:UIFont = UIFont(name: "Montserrat-Medium", size: 10)!
    static let largeLocationFont:UIFont = UIFont(name: "Montserrat-Bold", size: 14)!
    static let subHeadingLocationFont:UIFont = UIFont(name: "Montserrat-SemiBold", size: 14)!
    static let btnLocationFont:UIFont = UIFont(name: "Montserrat-Bold", size: 12)!
    static let RegularBtnLocationFont:UIFont = UIFont(name: "Montserrat-Bold", size: 8)!
    
    static let titleAddLocationFont:UIFont = UIFont(name: "Montserrat-SemiBold", size: 16)!
    static let subtitleAddLocationFont:UIFont = UIFont(name: "Montserrat-Regular", size: 12)!
    static let fieldAddLocationFont:UIFont = UIFont(name: "Montserrat-Regular", size: 10)!
    static let fieldTypingAddLocationFont:UIFont = UIFont(name: "Montserrat-Regular", size: 10)!
    static let tagAddLocationFont:UIFont = UIFont(name: "Montserrat-Light", size: 10)!
//    static let smallAddLocationFont:UIFont = UIFont(name: "Montserrat-Medium", size: 8)!

    static let textBoxFont:UIFont = UIFont(name: "Montserrat-Light", size: 12)!

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
    
    static let searchBarAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioLightGrey,
        NSAttributedString.Key.font:searchBarFont
    ]
    
    static let SmallLocationInfoAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioGrey,
        NSAttributedString.Key.font:smallLocationFont
    ]
    static let RegularLocationInfoAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioGrey,
        NSAttributedString.Key.font:regularLocationFont
    ]
    static let LargeLocationInfoAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioGrey,
        NSAttributedString.Key.font:largeLocationFont
    ]
    static let SubHeadingLocationInfoAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioGrey,
        NSAttributedString.Key.font:subHeadingLocationFont
    ]
    static let SmallBtnLocationInfoAttr: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.white,
        NSAttributedString.Key.font:smallLocationFont
    ]
    static let RegularBtnLocationInfoAttr: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.white,
        NSAttributedString.Key.font:RegularBtnLocationFont
    ]
    static let BtnLocationInfoAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.white,
        NSAttributedString.Key.font:btnLocationFont
    ]
    static let TextBoxInfoAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(1.0),
        NSAttributedString.Key.foregroundColor:studioGrey,
        NSAttributedString.Key.font:textBoxFont
    ]

    
    //AddLocation Fonts
    static let TitleAddLocationAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioGrey,
        NSAttributedString.Key.font:titleAddLocationFont
    ]
    static let SubtitleAddLocationAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.black,
        NSAttributedString.Key.font:subtitleAddLocationFont
    ]
    static let FieldAddLocationAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.black,
        NSAttributedString.Key.font:fieldAddLocationFont
    ]
    static let TagAddLocationAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:UIColor.black,
        NSAttributedString.Key.font:tagAddLocationFont
    ]
    
    static let MarkerInfoTitleAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioGrey,
        NSAttributedString.Key.font:markerInfoTitleFont
    ]
    static let MarkerInfoAttributes: NSDictionary = [
        NSAttributedString.Key.kern:CGFloat(2.0),
        NSAttributedString.Key.foregroundColor:studioGrey,
        NSAttributedString.Key.font:lightFont
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

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension NSAttributedString {
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.width)
    }
}
