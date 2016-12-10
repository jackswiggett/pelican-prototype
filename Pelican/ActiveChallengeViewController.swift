//
//  ActiveChallengeViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/9/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class ActiveChallengeViewController: UIViewController {

    var activeChallengeIndex: Int?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var tipButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for button in [tipButton, completeButton, removeButton] {
            button?.titleLabel?.textAlignment = .center
            button?.layer.cornerRadius = Constants.buttonCornerRadius
            button?.clipsToBounds = true
        }
        
        let challenge = AppData.activeChallenges[activeChallengeIndex!]
        nameLabel.text = challenge.name
        pointsLabel.text = String(challenge.points) + " pts"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTip(_ sender: UIButton) {
        let challenge = AppData.activeChallenges[activeChallengeIndex!]
        let alert = UIAlertController(title: "Tip", message: challenge.tip, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func challengeComplete(_ sender: UIButton) {
        // for now, we just remove the challenge from the list of active challenges
        removeChallenge(sender)
    }
    
    @IBAction func removeChallenge(_ sender: UIButton) {
        AppData.activeChallenges.remove(at: activeChallengeIndex!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
