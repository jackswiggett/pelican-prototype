//
//  AttemptGroupChallengeViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/8/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class AttemptGroupChallengeViewController: UIViewController {

    var challenge: GroupChallenge?
    var srvc: SWRevealViewController?
    @IBOutlet weak var challengeName: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var tipButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        challengeName.text = challenge!.name
        pointsLabel.text = String(challenge!.points) + " pts"
        
        for button in [tipButton, joinButton, newButton] {
            button?.titleLabel?.textAlignment = .center
            button?.layer.cornerRadius = Constants.buttonCornerRadius
            button?.clipsToBounds = true
        }
    }

    @IBAction func viewTip(_ sender: UIButton) {
        let alert = UIAlertController(title: "Tip", message: challenge?.tip, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsVC = segue.destination as? GroupChallengeSettingsViewController {
            settingsVC.challenge = challenge
            settingsVC.srvc = srvc
        }
    }

}
