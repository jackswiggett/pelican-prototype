//
//  AppData.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/1/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import MapKit

/* Stores data about challenges and application users. Note that this is a prototype,
 * so data is hard-coded and will be reset when the application is reloaded. */
class AppData {
    // MARK: User Data
    static let thisUser = ThisUser(firstName: "Jane", lastName: "Doe", profilePhoto: #imageLiteral(resourceName: "profilePhotoThisUser"), points: 43, pointsThisWeek: 16, pointsThisMonth: 38,
        pointsDataThisWeek: [27, 27, 33, 35, 38, 38, 43],
        pointsDataThisMonth: [5, 10, 12, 21, 21, 27, 35, 43],
        pointsDataAllTime: [0, 3, 5, 10, 12, 21, 21, 27, 35, 43]
    )
    static let otherUsers = [
        User(firstName: "Shirley", lastName: "Scott", profilePhoto: #imageLiteral(resourceName: "profilePhotoFemale1"), points: 70, pointsThisWeek: 11, pointsThisMonth: 39),
        User(firstName: "Gus", lastName: "Ceelen", profilePhoto: #imageLiteral(resourceName: "profilePhotoMale1"), points: 112, pointsThisWeek: 18, pointsThisMonth: 30),
        User(firstName: "Isabella", lastName: "García", profilePhoto: #imageLiteral(resourceName: "profilePhotoFemale2"), points: 21, pointsThisWeek: 21, pointsThisMonth: 21),
        User(firstName: "Gerda", lastName: "Aquino", profilePhoto: #imageLiteral(resourceName: "profilePhotoFemale3"), points: 107, pointsThisWeek: 0, pointsThisMonth: 0),
        User(firstName: "Nahia", lastName: "Borg", profilePhoto: #imageLiteral(resourceName: "profilePhotoFemale4"), points: 67, pointsThisWeek: 9, pointsThisMonth: 24),
        User(firstName: "Truman", lastName: "Jonsson", profilePhoto: #imageLiteral(resourceName: "profilePhotoMale3"), points: 14, pointsThisWeek: 10, pointsThisMonth: 14),
        User(firstName: "Brynmor", lastName: "Wilcox", profilePhoto: #imageLiteral(resourceName: "profilePhotoMale4"), points: 45, pointsThisWeek: 14, pointsThisMonth: 14)
    ]
    
    // MARK: Challenge Data
    private static let groupChallenges = [
        GroupChallenge(name: "Climb up Hoover Tower", points: 7, tip: nil, latitude: 37.427546, longitude: -122.166988)
    ]
    private static let soloChallenges = [
        SoloChallenge(name: "Ask a stranger what time it is", points: 2, tip: nil)
    ]
    
    static func getGroupChallengeById(_ id: Int) -> GroupChallenge? {
        if (id < groupChallenges.count) {
            return groupChallenges[id]
        } else {
            return nil
        }
    }
    static func getSoloChallengeById(_ id: Int) -> SoloChallenge? {
        if (id < soloChallenges.count) {
            return soloChallenges[id]
        } else {
            return nil
        }
    }

    static let challengeAnnotations = [
        ChallengeAnnotation(groupChallenge: getGroupChallengeById(0)!),
        ChallengeAnnotation(soloChallenge: getSoloChallengeById(0)!, recentlyCompletedBy: [otherUsers[2]], location: CLLocationCoordinate2D(latitude: 37.428366, longitude: -122.173648))
    ]
}
