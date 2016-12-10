//
//  ActiveChallengesViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/2/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class ActiveChallengesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
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

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: Table View Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.activeChallenges.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier: String
        if AppData.activeChallenges[indexPath.row] is SoloChallenge {
            cellIdentifier = "ActiveSoloChallengeCell"
        } else {
            cellIdentifier = "ActiveGroupChallengeCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ActiveChallengesTableViewCell
        
        let challenge = AppData.activeChallenges[indexPath.row]
        
        cell.nameLabel.text = challenge.name
        cell.pointsLabel.text = String(challenge.points) + " pts"
        if let _ = challenge as? GroupChallenge {
            cell.challengeTypeIcon.image = #imageLiteral(resourceName: "mapIconGroupChallenge")
        } else {
            cell.challengeTypeIcon.image = #imageLiteral(resourceName: "mapIconSoloChallenge")
        }
        
        return cell
    }
    
    // MARK: Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ActiveChallengeViewController {
            if let selectedCell = sender as? ActiveChallengesTableViewCell {
                let indexPath = tableView.indexPath(for: selectedCell)!
                destination.activeChallengeIndex = indexPath.row
            }
        }
    }

}
