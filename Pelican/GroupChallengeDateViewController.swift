//
//  GroupChallengeDateViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/9/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class GroupChallengeDateViewController: UIViewController {

    var srvc: SWRevealViewController?
    var challenge: GroupChallenge?
    @IBOutlet weak var challengeName: UILabel!
    @IBOutlet weak var createGroupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        challengeName.text = challenge!.name

        createGroupButton?.layer.cornerRadius = Constants.buttonCornerRadius
        createGroupButton?.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let successVC = segue.destination as? ChallengeAddedViewController {
            successVC.challenge = challenge
            successVC.srvc = srvc
        }
    }
}
