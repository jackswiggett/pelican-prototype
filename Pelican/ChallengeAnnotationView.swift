//
//  ChallengeAnnotationView.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/8/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import MapKit

fileprivate let iconWidth: Double = 40
fileprivate let iconHeight: Double = 61
fileprivate let buttonSize: CGFloat = 35

class ChallengeAnnotationView: MKAnnotationView {
    let discoverViewController: DiscoverViewController!
    
    func challengeIcon(challengeType: ChallengeAnnotation.ChallengeType) -> UIImage {
        let newSize = CGSize(width: iconWidth, height: iconHeight)
        let image: UIImage
        switch challengeType {
        case .group:
            image = #imageLiteral(resourceName: "mapIconGroupChallenge")
        case .solo:
            image = #imageLiteral(resourceName: "mapIconSoloChallenge")
        }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale);
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    init(challengeAnnotation annotation: ChallengeAnnotation, reuseIdentifier: String?, discoverViewController: DiscoverViewController) {
        self.discoverViewController = discoverViewController
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.image = challengeIcon(challengeType: annotation.challengeType)
        self.centerOffset = CGPoint(x: 0, y: -iconHeight / 2)
        self.canShowCallout = true
        self.calloutOffset = CGPoint(x: 0, y: -5)
        
        self.detailCalloutAccessoryView = ChallengeAnnotationDetailView(challengeAnnotation: annotation, discoverViewController: discoverViewController)
        
        let attemptButton = UIButton()
        attemptButton.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        attemptButton.setImage(#imageLiteral(resourceName: "attemptChallenge"), for: .normal)
        
        attemptButton.addTarget(self, action: #selector(ChallengeAnnotationView.attemptChallenge(sender:)), for: .touchUpInside)
        
        self.rightCalloutAccessoryView = attemptButton
    }
    
    func attemptChallenge(sender: UIButton) {
        let destination: UIViewController
        
        if let annotation = self.annotation as? ChallengeAnnotation {
            switch annotation.challengeType {
            case .group:
                let attemptVC = discoverViewController.storyboard!.instantiateViewController(withIdentifier: "AttemptGroupChallenge") as! AttemptGroupChallengeViewController
                attemptVC.challenge = annotation.challenge as? GroupChallenge
                attemptVC.srvc = discoverViewController.revealViewController()
                destination = attemptVC
            case .solo:
                let attemptVC = discoverViewController.storyboard!.instantiateViewController(withIdentifier: "AttemptSoloChallenge") as! AttemptSoloChallengeViewController
                attemptVC.challenge = annotation.challenge as? SoloChallenge
                attemptVC.srvc = discoverViewController.revealViewController()
                destination = attemptVC
            }
            
            destination.modalTransitionStyle = .flipHorizontal
            
            let navController = UINavigationController(rootViewController: destination)
            navController.isNavigationBarHidden = true
            navController.setViewControllers([destination], animated:true)
            
            discoverViewController.present(navController, animated: true, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.discoverViewController = nil
        super.init(coder: aDecoder)
    }

}
