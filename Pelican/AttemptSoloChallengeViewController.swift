//
//  AttemptSoloChallengeViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/8/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class AttemptSoloChallengeViewController: UIViewController {

    var srvc: SWRevealViewController?
    var challenge: SoloChallenge?
    @IBOutlet weak var challengeName: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var tipButton: UIButton!
    @IBOutlet weak var attemptButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        challengeName.text = challenge!.name
        pointsLabel.text = String(challenge!.points) + " pts"
        
        for button in [tipButton, attemptButton] {
            button?.titleLabel?.textAlignment = .center
            button?.layer.cornerRadius = Constants.buttonCornerRadius
            button?.clipsToBounds = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTip(_ sender: UIButton) {
        let alert = UIAlertController(title: "Tip", message: challenge?.tip, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Navigation
    
    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let successVC = segue.destination as? ChallengeAddedViewController {
            successVC.challenge = challenge
            successVC.srvc = srvc
        }
    }

}
