//
//  FeedViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/1/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var feedScope: FeedScope?
    var feedEntries: [FeedEntry] = AppData.feedNearby
    
    // MARK: Types
    
    enum FeedScope: Int {
        case nearby = 0
        case friends
        case you
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure menu button to show navigation menu
        if let revealViewController = self.revealViewController() {
            menuButton.target = revealViewController
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func scopeChanged(_ sender: UISegmentedControl) {
        feedScope = FeedScope(rawValue: sender.selectedSegmentIndex)!
        switch feedScope! {
        case .nearby:
            feedEntries = AppData.feedNearby
        case .friends:
            feedEntries = AppData.feedFriends
        case .you:
            feedEntries = AppData.feedYou
        }
        
        feedTableView.reloadData()
    }
    
    // MARK: Table View Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "FeedCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FeedTableViewCell
        
        let entry = feedEntries[indexPath.row]
        
        cell.descriptionLabel.text = entry.description
        cell.timeLabel.text = entry.time
        cell.profileImageView.image = entry.users[0].profilePhoto
        
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
