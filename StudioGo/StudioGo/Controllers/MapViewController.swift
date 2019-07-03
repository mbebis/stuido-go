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

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    let _screenWidth = GlobalConstants.screenWidth
    let _screenHeight = GlobalConstants.screenHeight
    
    //    let camera = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 6.0)
    let gmsMapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: GlobalConstants.screenWidth, height: GlobalConstants.screenHeight), camera: GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 1.0))
    let geoCoder = CLGeocoder()
    
    let locations = "Locations.json"
    var markers: [Marker] = []
    
    let iconSize = CGSize.init(width: 54, height: 50)
    
    let searchField =  UITextField()
    let filterInfo = UIView()
    let markerInfoView = MarkerInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        self.view.addSubview(markerInfoView.createView())
        mapSetup()
        // Do any additional setup after loading the view.
        
        searchFieldCreate()
        filterInfoCreate()
        //        setupOptions()
        NotificationCenter.default.addObserver(self, selector: #selector(addLocationNotif), name: NSNotification.Name(rawValue: "addLocationNotification"), object: nil)
    }
    
    func searchFieldCreate() {
        let navBarHeight = 72
        
        searchField.frame = CGRect(x: (_screenWidth/2)-((_screenWidth-40)/2), y: CGFloat.init(navBarHeight+16), width: _screenWidth-40, height: CGFloat.init(32))
        
        searchField.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 24, height: searchField.frame.height))
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
        
        filterInfo.backgroundColor = .white
        filterInfo.isHidden = false
        filterInfo.tintColor = .white
        
        filterInfo.frame = CGRect(x: (self.view.bounds.width/2)-((self.view.bounds.width-40)/2), y: searchFieldY+8, width: self.view.bounds.width-40, height: 32)
        filterInfo.layer.borderColor = (UIColor.white).cgColor
        filterInfo.layer.borderWidth = 1
        filterInfo.layer.cornerRadius = filterInfo.bounds.height / 2.0
        filterInfo.layer.masksToBounds = true
        
        let filterButton = UIButton.init(frame: CGRect(x: 5, y: 5, width: (filterInfo.bounds.width/4)-1, height: 22))
        
        filterButton.backgroundColor = .black
        filterButton.isHidden = false
        //        filterButton.tintColor = .black
        
        filterButton.layer.borderColor = (UIColor.black).cgColor
        filterButton.layer.borderWidth = 1
        filterButton.layer.cornerRadius = filterButton.bounds.height / 2.0
        filterButton.layer.masksToBounds = true
        filterButton.setTitle("FILTER", for: .normal)
        filterButton.setTitleColor(.white, for: .normal)
        filterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let locationType = UILabel.init(frame: CGRect(x: 4+(filterInfo.bounds.width/4), y: 4, width: (filterInfo.bounds.width/4)-2, height: 24))
        locationType.textAlignment = .center
        locationType.text = "STUDIO"
        locationType.textColor = .black
        locationType.font = UIFont.boldSystemFont(ofSize: 16)
        
        let area = UILabel.init(frame: CGRect(x: 4+(filterInfo.bounds.width/4)*2, y: 4, width: ((filterInfo.bounds.width/6)*2)-2, height: 24))
        area.textAlignment = .center
        area.text = "DOWNTOWN"
        area.textColor = .black
        area.font = UIFont.boldSystemFont(ofSize: 16)
        
        let radius = UILabel.init(frame: CGRect(x: 4+(filterInfo.bounds.width/4)*2 + (filterInfo.bounds.width/6)*2, y: 4, width: (filterInfo.bounds.width/6), height: 24))
        radius.textAlignment = .center
        radius.text = "2KM"
        radius.textColor = .black
        radius.font = UIFont.boldSystemFont(ofSize: 16)
        
        filterInfo.addSubview(filterButton)
        filterInfo.addSubview(locationType)
        filterInfo.addSubview(area)
        filterInfo.addSubview(radius)
        
        self.view.addSubview(filterInfo)
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
                
                geoCoder.geocodeAddressString(jsonObj["1"]["address"].string!) { (placemarks, error) in
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
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(json["address"].string!) { (placemarks, error) in
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
            marker.title = json["address"].string!
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
