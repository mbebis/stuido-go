//
//  MapModel.swift
//  StudioGo
//
//  Created by Owner on 7/4/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//
import UIKit

struct Location {
    var accessibility: String
    var city: String
    var cost: String
    var country: String
    var description: String
    var equipment: String
    var hasPermit: Bool
    var images: Array<String>
    var isPrivate: Bool
    var locationTitle: String
    var postalCode: String
    var province: String
    var spaceType: String
    var streetAddress: String
}

class MapModelController {
    
    static let shared = MapModelController(location: [])
    
    private var locations: Array<Location>
    
    init(location: Array<Location>) {
        self.locations = location
    }
    
    func addLocation(location: Location) {
        self.locations.append(location)
    }
    
    func getLocations() -> Array<Location> {
        return self.locations
    }
    
    func getLocationByTitle(title: String) -> Location? {
        for location in self.locations {
            let locationTitle = location.locationTitle.lowercased()
            print("LC: ", locationTitle, title)
            if (locationTitle.elementsEqual(title)) {
                print("Found!")
                return location
            }
        }
        return nil
    }
    
}
