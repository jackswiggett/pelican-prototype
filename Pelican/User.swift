//
//  User.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/1/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

/* Represents a single user of this application */
class User {
    var firstName: String
    var lastName: String
    var profilePhoto: UIImage?
    
    var points: Int
    var pointsThisWeek: Int
    var pointsThisMonth: Int
    
    init(firstName: String, lastName: String, profilePhoto: UIImage? = nil, points: Int = 0, pointsThisWeek: Int = 0, pointsThisMonth: Int = 0) {
        self.firstName = firstName
        self.lastName = lastName
        self.profilePhoto = profilePhoto
        
        self.points = points
        self.pointsThisWeek = pointsThisWeek
        self.pointsThisMonth = pointsThisMonth
    }
}

/* Represents the current user of the application */
class ThisUser : User {
    override init(firstName: String, lastName: String, profilePhoto: UIImage?, points: Int, pointsThisWeek: Int, pointsThisMonth: Int) {
        super.init(firstName: firstName, lastName: lastName, profilePhoto: profilePhoto, points: points, pointsThisWeek: pointsThisWeek, pointsThisMonth: pointsThisMonth)
    }
}
