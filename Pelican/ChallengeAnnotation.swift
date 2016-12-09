//
//  ChallengeAnnotation.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/8/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import MapKit

class ChallengeAnnotation: NSObject, MKAnnotation {
    let challenge: Challenge
    let challengeType: ChallengeType
    let recentlyCompletedBy: [User]
    var coordinate: CLLocationCoordinate2D
    var title: String? = " "
    
    enum ChallengeType: String {
        case solo = "solo"
        case group = "group"
    }
    
    convenience init(groupChallenge challenge: GroupChallenge, recentlyCompletedBy: [User] = []) {
        self.init(challenge: challenge, challengeType: .group, recentlyCompletedBy: recentlyCompletedBy, location: challenge.location.coordinate)
    }
    
    convenience init(soloChallenge challenge: SoloChallenge, recentlyCompletedBy: [User], location: CLLocationCoordinate2D) {
        self.init(challenge: challenge, challengeType: .solo, recentlyCompletedBy: recentlyCompletedBy, location: location)
    }
    
    private init(challenge: Challenge, challengeType: ChallengeType, recentlyCompletedBy: [User], location: CLLocationCoordinate2D) {
        self.challenge = challenge
        self.challengeType = challengeType
        self.recentlyCompletedBy = recentlyCompletedBy
        self.coordinate = location
        
        super.init()
    }
}
