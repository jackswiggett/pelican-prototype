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
    
    var fullName: String {
        get {
            let lastInitial = String(lastName[lastName.startIndex]).uppercased()
            return "\(firstName) \(lastInitial)."
        }
    }
    
    var feedName: String {
        get {
            return self.fullName
        }
    }
    
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
    let pointsDataThisWeek: [Int]
    let pointsDataThisMonth: [Int]
    let pointsDataAllTime: [Int]
    
    init(firstName: String, lastName: String, profilePhoto: UIImage?, points: Int, pointsThisWeek: Int, pointsThisMonth: Int, pointsDataThisWeek: [Int], pointsDataThisMonth: [Int], pointsDataAllTime: [Int]) {
        self.pointsDataThisWeek = pointsDataThisWeek
        self.pointsDataThisMonth = pointsDataThisMonth
        self.pointsDataAllTime = pointsDataAllTime
        
        super.init(firstName: firstName, lastName: lastName, profilePhoto: profilePhoto, points: points, pointsThisWeek: pointsThisWeek, pointsThisMonth: pointsThisMonth)
    }
    
    override var feedName: String {
        return "You"
    }
}
