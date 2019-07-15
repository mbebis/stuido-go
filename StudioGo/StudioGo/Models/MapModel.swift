//
//  MapModel.swift
//  StudioGo
//
//  Created by Owner on 7/4/19.
//  Copyright © 2019 Studio Go. All rights reserved.
//

struct Location {
    var city: String
    var cost: String
    var country: String
    var description: String
    var hasPermit: Bool
    var isPrivate: Bool
    var postalCode: String
    var province: String
    var streetAddress: String
    var tags: String
    var website: String
}

class MapModelController {
    
    static let shared = MapModelController(location: [])
    
    private var location: Array<Location>
    
    init(location: Array<Location>) {
        self.location = location
    }
    
    func addLocation(location: Location) {
        self.location.append(location)
    }
    
}
