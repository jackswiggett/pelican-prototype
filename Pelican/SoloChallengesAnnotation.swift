//
//  SoloChallengesAnnotation.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/9/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import MapKit

class SoloChallengesAnnotation: NSObject, MKAnnotation {
    var challenges: [SoloChallenge]
    var coordinate: CLLocationCoordinate2D
    var title: String? = " "
    
    init(challenges: [SoloChallenge], location: CLLocationCoordinate2D) {
        self.challenges = challenges
        self.coordinate = location
        
        super.init()
    }
}
