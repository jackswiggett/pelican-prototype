//
//  Challenge.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/8/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import MapKit

/* Represents a single challenge; SoloChallenge and GroupChallenge extend
 * this class */
class Challenge {
    let name: String
    let points: Int
    let tip: String?
    
    init(name: String, points: Int, tip: String?) {
        self.name = name
        self.points = points
        self.tip = tip
    }
}

class SoloChallenge : Challenge {}

class GroupChallenge : Challenge {
    let location: CLLocation
    
    init(name: String, points: Int, tip: String?, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        super.init(name: name, points: points, tip: tip)
    }
}
