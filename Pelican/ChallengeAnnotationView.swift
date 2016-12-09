//
//  ChallengeAnnotationView.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/8/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import MapKit

internal let iconWidth: Double = 40
internal let iconHeight: Double = 61

class ChallengeAnnotationView: MKAnnotationView {
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
    
    init(challengeAnnotation annotation: ChallengeAnnotation, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.image = challengeIcon(challengeType: annotation.challengeType)
        self.centerOffset = CGPoint(x: 0, y: -iconHeight / 2)
        self.canShowCallout = true
        self.calloutOffset = CGPoint(x: 0, y: -5)
        
        self.detailCalloutAccessoryView = ChallengeAnnotationDetailView(challengeAnnotation: annotation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
