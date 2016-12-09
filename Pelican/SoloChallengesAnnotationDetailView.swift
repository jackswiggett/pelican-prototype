//
//  SoloChallengesAnnotationDetailView.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/9/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

fileprivate let upwardOffset: CGFloat = 25 // offset to fill the space occupied by the annotation title, which is equal to " " (title cannot be nil or the callout will not load)
fileprivate let titleHeight: CGFloat = 35
fileprivate let challengeHeight: CGFloat = 60
fileprivate let challengeWidth: CGFloat = 200
fileprivate let titleFont = UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold)
fileprivate let labelFont = UIFont.systemFont(ofSize: 15)
fileprivate let labelWidth: CGFloat = 140
fileprivate let buttonSize: CGFloat = 35

class AttemptButton: UIButton {
    var challenge: SoloChallenge?
}

class SoloChallengesAnnotationDetailView: UIView {
    let annotation: SoloChallengesAnnotation!
    let discoverViewController: DiscoverViewController!

    init (annotation: SoloChallengesAnnotation, discoverViewController: DiscoverViewController) {
        self.annotation = annotation
        self.discoverViewController = discoverViewController
        super.init(frame: CGRect.zero)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -upwardOffset, width: challengeWidth, height: titleHeight))
        titleLabel.text = "Solo Challenges"
        titleLabel.textAlignment = .center
        titleLabel.font = titleFont
        self.addSubview(titleLabel)
        
        for (index, challenge) in annotation.challenges.enumerated() {
            let challengeView = UIView(frame: CGRect(x: 0, y: -upwardOffset + titleHeight + CGFloat(index) * challengeHeight, width: challengeWidth, height: challengeHeight))
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: labelWidth, height: challengeHeight))
            label.numberOfLines = 0
            label.text = challenge.name
            label.font = labelFont
            challengeView.addSubview(label)
            
            let attemptButton = AttemptButton()
            attemptButton.frame = CGRect(x: challengeWidth - buttonSize, y: (challengeHeight - buttonSize) / 2, width: buttonSize, height: buttonSize)
            attemptButton.setImage(#imageLiteral(resourceName: "attemptChallenge"), for: .normal)
            attemptButton.challenge = challenge
            attemptButton.addTarget(self, action: #selector(SoloChallengesAnnotationDetailView.attemptChallenge(sender:)), for: .touchUpInside)
            challengeView.addSubview(attemptButton)
            
            self.addSubview(challengeView)
        }
        
        let widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: challengeWidth)
        
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: titleHeight + challengeHeight * CGFloat(annotation.challenges.count) - upwardOffset)
        
        self.addConstraint(heightConstraint)
        self.addConstraint(widthConstraint)
        
    }
    
    func attemptChallenge(sender: AttemptButton) {
        let destination: UIViewController
        
        if let challenge = sender.challenge {
            let attemptVC = discoverViewController.storyboard!.instantiateViewController(withIdentifier: "AttemptSoloChallenge") as! AttemptSoloChallengeViewController
            attemptVC.challenge = challenge
            attemptVC.srvc = discoverViewController.revealViewController()
            destination = attemptVC
            
            destination.modalTransitionStyle = .flipHorizontal
            
            let navController = UINavigationController(rootViewController: destination)
            navController.isNavigationBarHidden = true
            navController.setViewControllers([destination], animated:true)
            
            discoverViewController.present(navController, animated: true, completion: nil)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
