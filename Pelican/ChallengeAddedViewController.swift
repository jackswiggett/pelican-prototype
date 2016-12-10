//
//  ChallengeAddedViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/9/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class ChallengeAddedViewController: UIViewController {

    var srvc: SWRevealViewController?
    var challenge: Challenge?
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var viewActiveButton: UIButton!
    @IBOutlet weak var returnToMapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AppData.activeChallenges.append(challenge!)
        
        message.text = "\"\(challenge!.name)\" has been added to your active challenges"
        
        viewActiveButton?.layer.cornerRadius = Constants.buttonCornerRadius
        viewActiveButton?.clipsToBounds = true
        returnToMapButton?.layer.cornerRadius = Constants.buttonCornerRadius
        returnToMapButton?.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    
    @IBAction func returnToMap(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func viewActiveChallenges(_ sender: UIButton) {
        if let destination = self.storyboard?.instantiateViewController(withIdentifier: "ActiveChallenges") as? ActiveChallengesViewController {
            self.navigationController?.dismiss(animated: true, completion: nil)
            let navController = UINavigationController(rootViewController: destination)
            navController.isNavigationBarHidden = true
            navController.setViewControllers([destination], animated:true)
            srvc?.setFront(navController, animated: true)
        }
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
