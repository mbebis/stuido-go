//
//  MapViewController.swift
//  StudioGo
//
//  Created by Owner on 1/30/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

import UIKit
import GoogleMaps
import FontAwesome_swift
import SwiftyJSON

protocol MarkerInfo {
    var marker: GMSMarker {get set}
    var dataJson: JSON {get set}
}
struct Marker: MarkerInfo {
    var marker: GMSMarker
    var dataJson: JSON
}

//let locationsModel = MapModelController.init(location: [])

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    let locationsModel = MapModelController.shared
    
    let _screenWidth = GlobalConstants.screenWidth
    let _screenHeight = GlobalConstants.screenHeight
     let tabbarHeight:CGFloat = GlobalConstants.tabbarHeight
     let navBarHeight:CGFloat = GlobalConstants.navBarHeight
     let statusBarHeight:CGFloat = GlobalConstants.statusBarHeight
    
    //    let camera = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 6.0)
    let gmsMapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: GlobalConstants.screenWidth, height: GlobalConstants.screenHeight), camera: GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 1.0))
    let geoCoder = CLGeocoder()
    
    let locationsJSON = "Locations.json"
    let locations:Array<Location> = []
    var markers: [Marker] = []
    
    let iconSize = CGSize.init(width: 54, height: 50)
    
//    let searchField =  UITextField()
//    let filterInfo = UIView()
    let markerInfoView = MarkerInfoView()
    
    let searchFieldObj = SearchBarView(frame: CGRect.init(x: (GlobalConstants.screenWidth/2)-((GlobalConstants.screenWidth-40)/2), y: CGFloat.init(GlobalConstants.navBarHeight+16), width: GlobalConstants.screenWidth-40, height: CGFloat.init(32)), placeholder: NSAttributedString(string: "SEARCH", attributes: (GlobalConstants.greyTextRegularAttr as! [NSAttributedString.Key : Any])))
    var searchField = UITextField()
    
    let filterViewObj = FilterView(searchBarWidth: GlobalConstants.screenWidth-40, searchBarHeight: 32)
    var filterPanel = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        self.view.addSubview(markerInfoView.createView())
        mapSetup()
        // Do any additional setup after loading the view.
        
//        searchFieldCreate()
        searchFieldObj.setLeftViewImage(image: UIImage.fontAwesomeIcon(name: .search, style: .solid, textColor: .gray, size: CGSize.init(width: 20, height: 20)))
        searchField = searchFieldObj.setupView()
        view.addSubview(searchField)
        filterInfoCreate()
        //        setupOptions()
        loadLocationsFromJSON()
        
        filterPanel = filterViewObj.setupView()
        view.addSubview(filterPanel)
        
        NotificationCenter.default.addObserver(self, selector: #selector(addLocationNotif), name: NSNotification.Name(rawValue: "addLocationNotification"), object: nil)
    }
    
    func loadLocationsFromJSON() {
        if let path = Bundle.main.path(forResource: "locations", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                
                for (index,subJson):(String, JSON) in jsonObj {

                    locationsModel.addLocation(location: jsonToLocation(json: subJson))
//                    print(locationsModel)
                }
                
            } catch {
                // handle error
                print("Error has occured")
            }
        }
    }
    
    func jsonToLocation(json: JSON) -> Location {
//        let location: Location = Location(streetAddress: <#String#>)
        
        let city = json["city"].stringValue
        let cost = json["cost"].stringValue
        let country = json["country"].stringValue
        let description = json["description"].stringValue
        let hasPermit = json["hasPermit"].boolValue
        let isPrivate = json["city"].boolValue
        let postalCode = json["postalCode"].stringValue
        let province = json["province"].stringValue
        let streetAddress = json["streetAddress"].stringValue
        let tags = json["tags"].stringValue
        let website = json["website"].stringValue

        return Location(city: city, cost: cost, country: country, description: description, hasPermit: hasPermit, isPrivate: isPrivate, postalCode: postalCode, province: province, streetAddress: streetAddress, tags: tags, website: website)
    }
    
    func searchFieldCreate() {
        let navBarHeight = 72
        
        searchField.frame = CGRect(x: (_screenWidth/2)-((_screenWidth-40)/2), y: CGFloat.init(navBarHeight+16), width: _screenWidth-40, height: CGFloat.init(32))
        
//        searchField.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 24, height: searchField.frame.height))
        let searchIconView = UIImageView(frame: CGRect.init(x: (24/2)-6, y: (searchField.frame.height/2)-10, width: 20, height: 20))
        searchIconView.image = UIImage.fontAwesomeIcon(name: .search, style: .solid, textColor: .gray, size: searchIconView.bounds.size)
        searchField.leftView?.addSubview(searchIconView)
        searchField.leftViewMode = UITextField.ViewMode.always
        
        searchField.placeholder = "S E A R C H"
        searchField.isUserInteractionEnabled = true
        searchField.font = UIFont.systemFont(ofSize: 15)
        searchField.borderStyle = UITextField.BorderStyle.roundedRect
        searchField.layer.borderColor = (UIColor.white).cgColor
        searchField.layer.borderWidth = 1
        searchField.layer.cornerRadius = searchField.bounds.height / 2.0
        searchField.layer.masksToBounds = true
        searchField.autocorrectionType = UITextAutocorrectionType.no
        searchField.keyboardType = UIKeyboardType.default
        searchField.returnKeyType = UIReturnKeyType.done
        searchField.clearButtonMode = UITextField.ViewMode.whileEditing
        searchField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        searchField.delegate = self as? UITextFieldDelegate

        self.view.addSubview(searchField)
    }
    
    func filterInfoCreate() {
        let searchFieldY = searchField.frame.maxY
        let searchFieldMinX = searchField.frame.minX
        let padding:CGFloat = 6
        let smallButtonWidth:CGFloat = (_screenWidth/4)-searchFieldMinX/2-padding*(3/4)
        let buttonHeight:CGFloat = 24
        
        let filterButton = UIButton.init(frame: CGRect(x: searchFieldMinX, y: searchFieldY+padding*2, width: smallButtonWidth, height: buttonHeight))
        let filterText = NSAttributedString(string: "FILTER", attributes: (GlobalConstants.whiteFilterAttributes as! [NSAttributedString.Key : Any]))
        let locationTypeText = NSAttributedString(string: "STUDIO", attributes: (GlobalConstants.blackFilterAttributes as! [NSAttributedString.Key : Any]))
        let radiusText = NSAttributedString(string: "DISTANCE  80KM", attributes: (GlobalConstants.blackFilterAttributes as! [NSAttributedString.Key : Any]))
        filterButton.backgroundColor = .black
        filterButton.layer.cornerRadius = filterButton.bounds.height / 2.0
        filterButton.layer.masksToBounds = true
        filterButton.setAttributedTitle(filterText, for: .normal)
//        filterButton.attr
//        filterButton.setTitle("FILTER", for: .normal)
//        filterButton.setTitleColor(.white, for: .normal)
//        filterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        let locationType = UILabel.init(frame: CGRect(x: (_screenWidth/4)*2-padding/2-smallButtonWidth, y: searchFieldY+padding*2, width: smallButtonWidth, height: buttonHeight))
        locationType.backgroundColor = .white
        locationType.layer.cornerRadius = filterButton.bounds.height / 2.0
        locationType.layer.masksToBounds = true
        locationType.textAlignment = .center
        locationType.attributedText = locationTypeText

//        locationType.text = "STUDIO"
//        locationType.textColor = .black
//        locationType.font = UIFont.boldSystemFont(ofSize: 12)
        
        let radius = UILabel.init(frame: CGRect(x: (_screenWidth/4)*2+padding/2, y: searchFieldY+padding*2, width: (_screenWidth/2)-padding/2-searchFieldMinX, height: buttonHeight))
        radius.backgroundColor = .white
        radius.layer.cornerRadius = filterButton.bounds.height / 2.0
        radius.layer.masksToBounds = true
        radius.textAlignment = .center
        radius.attributedText = radiusText

//        radius.text = "DISTANCE 80KM"
//        radius.textColor = .black
//        radius.font = UIFont.boldSystemFont(ofSize: 12)
        
        view.addSubview(filterButton)
        view.addSubview(locationType)
        view.addSubview(radius)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapSetup() {
        
        gmsMapView.delegate = self
        gmsMapView.mapType = .normal
        self.view.addSubview(gmsMapView)
        
        if let path = Bundle.main.path(forResource: "locations", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                
                var address = jsonObj["1"]["streetAddress"].string!
                address.append(contentsOf: ", ")
                address.append(contentsOf: jsonObj["1"]["city"].string!)
                address.append(contentsOf: ", ")
                address.append(contentsOf: jsonObj["1"]["province"].string!)
                address.append(contentsOf: jsonObj["1"]["postalCode"].string!)
                address.append(contentsOf: ", ")
                address.append(contentsOf: jsonObj["1"]["country"].string!)

                geoCoder.geocodeAddressString(address) { (placemarks, error) in
                    guard
                        let placemarks = placemarks,
                        let location = placemarks.first?.location
                        else {
                            // handle no location found
                            return
                    }
                    
                    self.gmsMapView.camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 12.0)
                    
                    for (index,subJson):(String, JSON) in jsonObj {
                        self.addLocation(json: subJson)
                        print("Index: ", index)
                    }
                    //                    self.addLocation(address: "23 Regency View Heights, Maple, ON L6A3T9, Canada")
                }
            } catch {
                // handle error
                print("Error has occured")
            }
        } else {
            print("Invalid File")
        }
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(pushMoreInfo))
        for mark in markers {
            if (mark.marker == marker) {
                markerInfoView.updateView(json: mark.dataJson)
                markerInfoView.addGestureRecognizer(gesture)
                view.addSubview(markerInfoView)
            }
        }
        
        //        markerInfoView.updateView(address: marker.title!)
        //        markerInfoView.addGestureRecognizer(gesture)
        //        view.addSubview(markerInfoView)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.markerInfoView.frame = CGRect(x: self.markerInfoView.frame.minX, y: self._screenHeight-10-60-128, width: self.markerInfoView.bounds.width, height: self.markerInfoView.bounds.height)
            marker.iconView?.transform = CGAffineTransform(scaleX: 3.0, y: 3.0);
            
        })
        
        let emptyView = UIView(frame: CGRect.init(x: 0, y: 0, width: 1, height: 1))
        emptyView.backgroundColor = .clear
        return emptyView
    }
    
    func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
        //make markerinfoview a part of this ocntroller then just slide it in and out and update it's values
        UIView.animate(withDuration: 0.2, animations: {
            marker.iconView?.transform = CGAffineTransform(scaleX: 1, y: 1);
            self.markerInfoView.frame = CGRect(x: self.markerInfoView.frame.minX, y: self._screenHeight, width: self.markerInfoView.bounds.width, height: self.markerInfoView.bounds.height)
        })
    }
    
    @objc func addLocationNotif(data: NSNotification) {
        let receivedData:NSDictionary = data.userInfo! as NSDictionary   //If data is of NSDictionary type.
        
        print("recieved")
        print(receivedData)
        
        let json: JSON = JSON(receivedData)
        
        addLocation(json: json)
    }
    
    func addLocation(json: JSON) {
//        let json: JSON = JSON([ "title" : "Ben", "location" : "Private", "cost" : "benji", "permit":"Yes", "address":"23 Regency View Heights, Maple, ON L6A3T9, Canada", "website": "home.com", "contact": "hello@thisisfr.ee","description":"Home"])
        var address = json["streetAddress"].string!
        address.append(contentsOf: ", ")
        address.append(contentsOf: json["city"].string!)
        address.append(contentsOf: ", ")
        address.append(contentsOf: json["province"].string!)
        address.append(contentsOf: " ")
        address.append(contentsOf: json["postalCode"].string!)
        address.append(contentsOf: ", ")
        address.append(contentsOf: json["country"].string!)
        print(address)
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // handle no location found
                    return
            }
            
            let marker = GMSMarker()
            marker.position = location.coordinate
            marker.groundAnchor = .init(x: 0.5, y: 0.5)
            marker.title = address
            //                        marker.snippet = "Australia"
            let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 18, height: 18))
            let icon = UIImage.init(named: "SmallLocationIcon")
            imageView.image = icon
            marker.iconView = imageView
            
            marker.map = self.gmsMapView
            
            self.markers.append(Marker(marker: marker, dataJson: json))
            
        }
    }
    
    //All available ViewControllers to navigate to from this view
    @objc func pushProfile() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc func pushMoreInfo() {
        self.navigationController?.pushViewController(LocationViewController(), animated: true)
    }
    
}
