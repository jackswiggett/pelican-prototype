//
//  FeedEntry.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/9/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class FeedEntry {
    var users: [User]
    var challenge: Challenge
    var time: String
    
    var description: String {
        get {
            var userNames: String = ""
            switch users.count {
            case 1:
                userNames = users[0].feedName
            case 2:
                userNames = users[0].feedName + " and " + users[1].feedName
            default:
                for i in 0..<(users.count - 1) {
                    userNames += users[i].feedName + ", "
                }
                userNames += "and " + users[users.count - 1].feedName
            }
            
            return "\(userNames) completed \"\(challenge.name)\""
        }
    }
    
    init(users: [User], challenge: Challenge, time: String) {
        self.users = users
        self.challenge = challenge
        self.time = time
    }
}
