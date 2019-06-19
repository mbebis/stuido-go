//
//  LocationViewController.swift
//  
//
//  Created by Owner on 4/8/19.
//

import UIKit
import FontAwesome_swift

class LocationViewController: UIViewController {
    
    struct Person {
        
        let name: String
        
        static var stubPerson: [Person] {
            return [
                Person(name: "Mark Hamill"),
                Person(name: "Harrison Ford"),
                Person(name: "Carrie Fisher"),
                Person(name: "Hayden Christensen"),
                Person(name: "Ewan McGregor"),
                Person(name: "Natalie Portman"),
                Person(name: "Liam Neeson")
            ]
        }
    }
    
    private let statusBarHeight:CGFloat = UIApplication.shared.statusBarFrame.height
    
    private let mediumFont:UIFont = GlobalConstants.mediumFont
    private let regularFont:UIFont = GlobalConstants.regularFont
    private let lightFont:UIFont = GlobalConstants.lightFont

    private let studioYellow = GlobalConstants.studioYellow
    private let studioGrey = GlobalConstants.studioGrey
    
    let scrollView = UIScrollView()
    //    frame: CGRect.init(x: 0, y: 72, width: Screen.width, height: Screen.height)
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        
        locationBannerImage()
        informationPane()
//        tableView()
        moreInfoTableView()
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.contentSize.height = scrollView.subviews.last!.frame.maxY
        
        //        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 800)
        //        scrollView.isScrollEnabled = true
        //        view.addSubview(scrollView)
        // Do any additional setup after loading the view.
    }
    
    func locationBannerImage() {
        let image = UIImage.init(named: "LocationBanner")
        let imagePane = UIImageView(frame: .init(x: 0, y: 72-statusBarHeight, width: Screen.width, height: Screen.height*(7/27)))
        imagePane.image = image
        imagePane.backgroundColor = .lightGray
        scrollView.addSubview(imagePane)
    }
    
    func informationPane() {
        let screenXCenter = Screen.width/2
        let infoPane = UIView()
//        let infoPane = UIView(frame: CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: Screen.height*(3/9)))
//                infoPane.backgroundColor = .blue
        
        let cornerBtnWidth: CGFloat = 24
        let cornerBtnPadding: CGFloat = 10
        let bookmarkBtn = iconBtn(frame: CGRect.init(x: cornerBtnPadding, y: cornerBtnPadding, width: cornerBtnWidth, height: cornerBtnWidth), icon: String.fontAwesomeIcon(name: .bookmark), style: .regular)
        infoPane.addSubview(bookmarkBtn)
        let shareBtn = iconBtn(frame: CGRect.init(x: Screen.width-cornerBtnPadding-cornerBtnWidth, y: cornerBtnPadding, width: cornerBtnWidth, height: cornerBtnWidth), icon: String.fontAwesomeIcon(name: .shareSquare), style: .solid)
        infoPane.addSubview(shareBtn)
        
        let labelWidth = Screen.width*(2/3)
        let largeLabelHeight: CGFloat = 20
        let labelHeight: CGFloat = 14
        let labelPadding: CGFloat = 6
        
        let locationTypeLabel = titleLabel(frame: CGRect.init(x: screenXCenter-labelWidth/2, y: 12, width: labelWidth, height: largeLabelHeight), text: "P U B L I C  L O C A T I O N", align: .center, font: lightFont)
        infoPane.addSubview(locationTypeLabel)
        let locationLabel = titleLabel(frame: CGRect.init(x: screenXCenter-labelWidth/2, y: locationTypeLabel.frame.maxY+4, width: labelWidth, height: largeLabelHeight), text: "G R A F F I T I  A L L E Y", align: .center, font: mediumFont)
        infoPane.addSubview(locationLabel)
        let addressLabel = titleLabel(frame: CGRect.init(x: screenXCenter-labelWidth/2, y: locationLabel.frame.maxY+4, width: labelWidth, height: labelHeight), text: "TORONTO, ON", align: .center, font: lightFont)
        infoPane.addSubview(addressLabel)
        
        for i in 1...5 {
            let starImage = UIImage.fontAwesomeIcon(name: .star, style: .solid, textColor: studioYellow, size: .init(width: 20, height: 20))
            let xPos:CGFloat = CGFloat(((i-3)*(20)))-CGFloat(10)
            let starImagePane = UIImageView(frame: .init(x: screenXCenter+xPos, y: addressLabel.frame.maxY+8, width: 20, height: 20))
            starImagePane.image = starImage
            infoPane.addSubview(starImagePane)
        }
        
        let buttonHeight: CGFloat = 20
        let buttonWidth: CGFloat = labelWidth
        let buttonPadding: CGFloat = 6

        let checkInBtn = ovalBtn(frame: CGRect.init(x: screenXCenter-buttonWidth/2, y: infoPane.subviews.last!.frame.maxY+8, width: buttonWidth/2-buttonPadding, height: buttonHeight), text: "CHECK IN")
        let reviewBtn = ovalBtn(frame: CGRect.init(x: screenXCenter+buttonPadding, y: infoPane.subviews.last!.frame.maxY+8, width: buttonWidth/2-buttonPadding, height: buttonHeight), text: "REVIEW")
        infoPane.addSubview(checkInBtn)
        infoPane.addSubview(reviewBtn)
        
        let viewAllBtn = ovalBtn(frame: CGRect.init(x: screenXCenter-buttonWidth/2, y: infoPane.subviews.last!.frame.maxY+8, width: buttonWidth, height: buttonHeight), text: "36 REVIEWS - VIEW ALL")
        infoPane.addSubview(viewAllBtn)
        
        let informationLabel = titleLabel(frame: CGRect.init(x: Screen.width/2-labelWidth/2, y: infoPane.subviews.last!.frame.maxY+12, width: labelWidth, height: largeLabelHeight), text: "INFORMATION", align: .center, font: mediumFont)
        infoPane.addSubview(informationLabel)
        
        let extraInfoPanePadding: CGFloat = 32
        let extraInfoCol1 = UIView(frame: .init(x: extraInfoPanePadding, y: infoPane.subviews.last!.frame.maxY+labelPadding, width: screenXCenter-extraInfoPanePadding, height: (largeLabelHeight*2)+(labelPadding*3)))
        let extraInfoCol2 = UIView(frame: .init(x: screenXCenter+extraInfoPanePadding, y: infoPane.subviews.last!.frame.maxY+labelPadding, width: screenXCenter-extraInfoPanePadding, height: (largeLabelHeight*2)+(labelPadding*3)))
        
        let priceLabel = titleLabel(frame: CGRect.init(x: 0, y: 0, width: labelWidth, height: largeLabelHeight), text: "PRICE RANGE: $$$$$", align: .left, font: regularFont)
        extraInfoCol1.addSubview(priceLabel)
        let accesibleLabel = titleLabel(frame: CGRect.init(x: 0, y: 0, width: labelWidth, height: largeLabelHeight), text: "ACCESIBLE: YES", align: .left, font: regularFont)
        extraInfoCol2.addSubview(accesibleLabel)
        let permitLabel = titleLabel(frame: CGRect.init(x: priceLabel.frame.minX, y: priceLabel.frame.maxY+labelPadding, width: labelWidth, height: largeLabelHeight), text: "PERMIT: NO", align: .left, font: regularFont)
        extraInfoCol1.addSubview(permitLabel)
        let typeLabel = titleLabel(frame: CGRect.init(x: accesibleLabel.frame.minX, y: accesibleLabel.frame.maxY+labelPadding, width: labelWidth, height: largeLabelHeight), text: "OUTDOORS", align: .left, font: regularFont)
        extraInfoCol2.addSubview(typeLabel)
        
        infoPane.addSubview(extraInfoCol1)
        infoPane.addSubview(extraInfoCol2)
        
        infoPane.frame = CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: infoPane.subviews.last!.frame.maxY)
        
        scrollView.addSubview(infoPane)
    }
    
    func tableView() {
        let optionsVC = GenericTableViewController(items: Person.stubPerson, configure: { (cell: UITableViewCell, person) in
            cell.textLabel?.text = person.name
            cell.frame = CGRect.init(x: 0, y: self.scrollView.subviews.last!.frame.maxY, width: Screen.width, height: 44)
        }) { (person) in
            print(person.name)
        }
        
        let optionsTableView = optionsVC.tableView
//        optionsTableView?.frame = CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: 0)
        optionsTableView?.layoutMargins = UIEdgeInsets.zero
        optionsTableView?.separatorInset = UIEdgeInsets.zero
        optionsTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        optionsTableView?.isScrollEnabled = false
        optionsTableView?.frame = CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: (optionsTableView?.subviews.last!.frame.maxY)!)
        scrollView.addSubview(optionsTableView!)
    }
    
    func moreInfoTableView() {
        let moreInfoTableView = UITableView(frame: CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: 0), style: UITableView.Style.plain)

        moreInfoTableView.layoutMargins = UIEdgeInsets.zero
        moreInfoTableView.separatorInset = UIEdgeInsets.zero
        moreInfoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")

        moreInfoTableView.isScrollEnabled = false
        
        moreInfoTableView.addSubview(moreInfoMenu2(text: "AVAILABLE EQUIPMENT", y: 0))
        moreInfoTableView.addSubview(moreInfoMenu2(text: "CONTACT", y: moreInfoTableView.subviews.last!.frame.maxY))
        moreInfoTableView.addSubview(moreInfoMenu2(text: "DIRECTIONS", y: moreInfoTableView.subviews.last!.frame.maxY))
        
        moreInfoTableView.separatorColor = .lightGray
        moreInfoTableView.separatorStyle = .singleLine

        moreInfoTableView.frame = CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: moreInfoTableView.subviews.last!.frame.maxY)
        let px = 1 / UIScreen.main.scale
        let line = UIView(frame: CGRect.init(x: 0, y: 0, width: moreInfoTableView.frame.size.width, height: px))
        moreInfoTableView.tableHeaderView = line
        line.backgroundColor = moreInfoTableView.separatorColor
        scrollView.addSubview(moreInfoTableView)
    }
    
    func tableViewCell(cell: UITableViewCell, text: String, y: CGFloat) -> Void {
        cell.frame = CGRect.init(x: 0, y: y, width: Screen.width, height: cell.frame.height)
        
        let cellTitle = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Screen.width, height: cell.frame.height))
        cellTitle.text = text
        cellTitle.textAlignment = .center
        cellTitle.font = regularFont
        cell.contentView.addSubview(cellTitle)
        
        let accessorySize: CGFloat = 26
        let accessorySizePadding: CGFloat = 6
        let cellImage = UIImage.fontAwesomeIcon(name: .chevronCircleRight, style: .solid, textColor: .lightGray, size: CGSize(width: accessorySize, height: accessorySize))
        let cellImageView = UIImageView.init(image: cellImage)
        cellImageView.frame = CGRect.init(x: Screen.width-accessorySize-accessorySizePadding, y: (cell.contentView.frame.height/2)-(accessorySize/2), width: accessorySize, height: accessorySize)
        cell.contentView.addSubview(cellImageView)
        //        cell.accessoryType = .disclosureIndicator
        //        cell.preservesSuperviewLayoutMargins = false
        //        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
    }
    
    func moreInfoMenu2(text: String, y: CGFloat) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "moreInfoMenu")
        cell.frame = CGRect.init(x: 0, y: y, width: Screen.width, height: cell.frame.height)
print(cell.frame.height)
        let cellTitle = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Screen.width, height: cell.frame.height))
        cellTitle.text = text
        cellTitle.textAlignment = .center
        cellTitle.font = regularFont
        cell.contentView.addSubview(cellTitle)
        
        let accessorySize: CGFloat = 26
        let accessorySizePadding: CGFloat = 6
        let cellImage = UIImage.fontAwesomeIcon(name: .chevronCircleRight, style: .solid, textColor: .lightGray, size: CGSize(width: accessorySize, height: accessorySize))
        let cellImageView = UIImageView.init(image: cellImage)
        cellImageView.frame = CGRect.init(x: Screen.width-accessorySize-accessorySizePadding, y: (cell.contentView.frame.height/2)-(accessorySize/2), width: accessorySize, height: accessorySize)
        cell.contentView.addSubview(cellImageView)
//        cell.accessoryType = .disclosureIndicator
        //        cell.preservesSuperviewLayoutMargins = false
        //        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    func moreInfoMenu(text: String) {
        let menu = UIView(frame: CGRect.init(x: 0, y: scrollView.subviews.last!.frame.maxY, width: Screen.width, height: 40))
        
        let labelHeight: CGFloat = 20
        let label = titleLabel(frame: CGRect.init(x: 0, y: menu.frame.height/2 - labelHeight, width: menu.frame.width, height: menu.frame.height), text: text, align: .center, font: regularFont)
        menu.addSubview(label)

        scrollView.addSubview(menu)
    }
    
    func iconBtn (frame: CGRect, icon: String, style: FontAwesomeStyle) -> UIButton {
        let btn = UIButton.init(frame: frame)
        btn.titleLabel?.font = UIFont.fontAwesome(ofSize: btn.frame.width-4, style: style)
        btn.setTitle(icon, for: .normal)
        btn.setTitleColor(studioGrey, for: .normal)
        return btn
    }
    
    func ovalBtn(frame: CGRect, text: String) -> UIButton {
        let buttonHeight: CGFloat = 20
        let buttonCornerRadius: CGFloat = buttonHeight/2
        
        let btn = UIButton.init(frame: frame)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = buttonCornerRadius
        btn.setTitle(text, for: UIControl.State.normal)
        btn.setTitleColor(.white, for: UIControl.State.normal)
        //        btn.titleLabel?.text = text
        return btn
    }
    
    func titleLabel(frame: CGRect, text: String, align: NSTextAlignment, font: UIFont) -> UILabel {
        let label = UILabel.init(frame: frame)
        label.textColor = studioGrey
        label.text = text
        label.textAlignment = align
        label.font = font
        
        return label
    }
    
}
