//
//  SoloChallengesAnnotationView.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/9/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

import MapKit

fileprivate let iconSize: Double = 60

class SoloChallengesAnnotationView: MKAnnotationView {
    func userIcon() -> UIImage {
        let newSize = CGSize(width: iconSize, height: iconSize)
        
        let image = #imageLiteral(resourceName: "mapIconUser")
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale);
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    init(annotation: SoloChallengesAnnotation, reuseIdentifier: String?, discoverViewController: DiscoverViewController) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.image = userIcon()
        self.canShowCallout = true
        self.calloutOffset = CGPoint(x: 0, y: -5)
        
        self.detailCalloutAccessoryView = SoloChallengesAnnotationDetailView(annotation: annotation, discoverViewController: discoverViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
