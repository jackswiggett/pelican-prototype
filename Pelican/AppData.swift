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
    static let currentLocation = CLLocation(latitude: 37.426264, longitude: -122.171746)
    
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
        GroupChallenge(name: "Climb up Hoover Tower", points: 7, tip: "The tower closes at 4pm, so be sure to get there on time!", latitude: 37.427546, longitude: -122.166988),
        GroupChallenge(name: "Explore the PACE Gallery", points: 6, tip: "Open 11am-7pm everyday; closed Mondays. Bring a friend with a camera.", latitude: 37.446846, longitude: -122.1723555),
        GroupChallenge(name: "Try the whispering circles", points: 5, tip: "Go at night so you can go roofing afterwards.", latitude: 37.4265368, longitude: -122.1705746),
        GroupChallenge(name: "Geocaching in the Wilbur Field garage", points: 6, tip: "Look up!", latitude: 37.4242108, longitude: -122.1664118),
        GroupChallenge(name: "Listen to Monument to Change as it Changes", points: 6, tip: "Go at lunch to do some MBA spotting.", latitude: 37.4279363, longitude: -122.1630839),
        GroupChallenge(name: "People watching at the Claw", points: 2, tip: nil, latitude: 37.4247881, longitude: -122.1702078),
        GroupChallenge(name: "Visit the O'Donohue farm", points: 7, tip: "There are beehives in an enclosure! Don't go in - just listen to the buzzing from outside.", latitude: 37.4271439, longitude: -122.183651),
        GroupChallenge(name: "Sit in the muji beanbags", points: 4, tip: "And check out the vaporizers.", latitude: 37.4442598, longitude: -122.1725674)
    ]
    private static let soloChallenges = [
        SoloChallenge(name: "Ask a stranger what time it is", points: 2, tip: "Start with \"excuse me,\" follow with a casual greeting, and transition straight to your question. No need for a lengthy introduction!"),
        SoloChallenge(name: "Ask a stranger what \"it's lit\" means", points: 3, tip: "Start with \"excuse me,\", follow with a casual greeting, and transition straight to your question. No need for a lengthy introduction!"),
        SoloChallenge(name: "Ask for directions to a nearby bookstore", points: 3, tip: "Start with \"excuse me,\", follow with a casual greeting, and transition straight to your question. No need for a lengthy introduction!")
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
    
    // MARK: Map Annotations
    static let challengeAnnotations = [
        ChallengeAnnotation(groupChallenge: getGroupChallengeById(0)!),
        ChallengeAnnotation(groupChallenge: getGroupChallengeById(1)!),
        ChallengeAnnotation(groupChallenge: getGroupChallengeById(2)!),
        ChallengeAnnotation(groupChallenge: getGroupChallengeById(3)!),
        ChallengeAnnotation(groupChallenge: getGroupChallengeById(4)!),
        ChallengeAnnotation(groupChallenge: getGroupChallengeById(5)!),
        ChallengeAnnotation(groupChallenge: getGroupChallengeById(6)!),
        ChallengeAnnotation(groupChallenge: getGroupChallengeById(7)!),
        ChallengeAnnotation(soloChallenge: getSoloChallengeById(0)!, recentlyCompletedBy: [otherUsers[2]], location: CLLocationCoordinate2D(latitude: 37.428366, longitude: -122.173648))
    ]
    
    static let soloChallengesAnnotation = SoloChallengesAnnotation(challenges: [
            soloChallenges[0],
            soloChallenges[1],
            soloChallenges[2]
        ], location: currentLocation.coordinate)
    
    // MARK: Feed Data
    static let feedNearby = [
        FeedEntry(users: [otherUsers[1], otherUsers[4], otherUsers[5]], challenge: groupChallenges[3], time: "15m"),
        FeedEntry(users: [otherUsers[0], otherUsers[2]], challenge: groupChallenges[1], time: "45m"),
        FeedEntry(users: [otherUsers[6]], challenge: soloChallenges[2], time: "1h"),
        FeedEntry(users: [otherUsers[5], otherUsers[4]], challenge: groupChallenges[5], time: "2h"),
        FeedEntry(users: [otherUsers[2], otherUsers[3], otherUsers[6]], challenge: groupChallenges[2], time: "2h"),
        FeedEntry(users: [otherUsers[0]], challenge: soloChallenges[1], time: "4h")
    ]
    
    static let feedFriends = [
        FeedEntry(users: [otherUsers[2], otherUsers[0]], challenge: groupChallenges[1], time: "45m"),
        FeedEntry(users: [otherUsers[2], otherUsers[3], otherUsers[6]], challenge: groupChallenges[2], time: "2h"),
        FeedEntry(users: [otherUsers[0]], challenge: soloChallenges[1], time: "4h"),
        FeedEntry(users: [thisUser, otherUsers[1]], challenge: groupChallenges[1], time: "6h"),
        FeedEntry(users: [otherUsers[3]], challenge: soloChallenges[0], time: "12h"),
        FeedEntry(users: [thisUser, otherUsers[2], otherUsers[0]], challenge: groupChallenges[6], time: "1d"),
    ]
    
    static let feedYou = [
        FeedEntry(users: [thisUser], challenge: soloChallenges[0], time: "15m"),
        FeedEntry(users: [thisUser, otherUsers[1]], challenge: groupChallenges[1], time: "6h"),
        FeedEntry(users: [thisUser, otherUsers[2], otherUsers[0]], challenge: groupChallenges[6], time: "1d"),
        FeedEntry(users: [thisUser, otherUsers[0]], challenge: groupChallenges[5], time: "1d"),
        FeedEntry(users: [thisUser], challenge: soloChallenges[2], time: "3d"),
        FeedEntry(users: [thisUser], challenge: soloChallenges[1], time: "4d"),
    ]
}
