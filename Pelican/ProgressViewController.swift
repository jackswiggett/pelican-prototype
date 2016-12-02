//
//  ProgressViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/1/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var leaderboardTableView: UITableView!
    let numUsersInLeaderboard = 10
    var leaderboardUsers = [User]()
    var timeScale = TimeScale.week
    
    // MARK: Types
    
    enum TimeScale: Int {
        case week = 0
        case month
        case allTime
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure menu button to show navigation menu
        if let revealViewController = self.revealViewController() {
            menuButton.target = revealViewController
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
        
        updateLeaderboardUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func changeTimeScale(_ sender: UISegmentedControl) {
        timeScale = TimeScale(rawValue: sender.selectedSegmentIndex)!
        updateLeaderboardUsers()
        reloadLeaderboard()
    }
    
    // MARK: Leaderboard Management
    
    func numPoints(_ user: User) -> Int {
        switch timeScale {
        case .week:
            return user.pointsThisWeek
        case .month:
            return user.pointsThisMonth
        case .allTime:
            return user.points
        }
    }
    
    func updateLeaderboardUsers() {
        var allUsers = AppData.otherUsers + [AppData.thisUser]
        allUsers.sort(by: { numPoints($0) > numPoints($1) })
        
        let numUsers = min(allUsers.count, numUsersInLeaderboard)
        leaderboardUsers = Array(allUsers[0..<numUsers])
    }
    
    func reloadLeaderboard() {
        leaderboardTableView.reloadData()
    }
    
    // MARK: Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboardUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "LeaderboardCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LeaderboardTableViewCell
        
        let user = leaderboardUsers[indexPath.row]
        let firstName = user.firstName
        let lastInitial = String(user.lastName[user.lastName.startIndex]).uppercased()
        
        cell.nameLabel.text = "\(firstName) \(lastInitial)."
        cell.rankLabel.text = String(indexPath.row + 1)
        cell.pointsLabel.text = String(numPoints(user))
        cell.profileImageView.image = user.profilePhoto
        
        if user === AppData.thisUser {
            // Highlight the current user of the application in the leaderboard
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        } else {
            cell.backgroundColor = UIColor.clear
        }
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
