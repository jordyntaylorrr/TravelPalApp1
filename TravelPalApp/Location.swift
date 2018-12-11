//
//  Location.swift
//  TravelPalApp
//
//  Created by DMSIMAC04 on 12/11/18.
//  Copyright © 2018 jordyn hollingsworth. All rights reserved.
//

import MapKit

class Location: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let image : String?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, image: String) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.image = image
    }
    
}
