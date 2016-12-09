//
//  ChallengeAnnotationDetailView.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/8/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

fileprivate let upwardOffset: CGFloat = 30 // offset to fill the space occupied by the annotation title, which is equal to " " (title cannot be nil or the callout will not load)
fileprivate let labelHeight: CGFloat = 45
fileprivate let labelWidth: CGFloat = 140
fileprivate let labelFont = UIFont.systemFont(ofSize: 15)

class ChallengeAnnotationDetailView: UIView {
    let annotation: ChallengeAnnotation!
    let discoverViewController: DiscoverViewController!
    
    init(challengeAnnotation annotation: ChallengeAnnotation, discoverViewController: DiscoverViewController) {
        self.annotation = annotation
        self.discoverViewController = discoverViewController
        super.init(frame: CGRect.zero)
        
        let label = UILabel(frame: CGRect(x: 0, y: -upwardOffset, width: labelWidth, height: labelHeight))
        label.numberOfLines = 0
        label.text = annotation.challenge.name
        label.font = labelFont
        self.addSubview(label)
        
        let widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: labelWidth)
        
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: labelHeight - upwardOffset)
        
        self.addConstraint(heightConstraint)
        self.addConstraint(widthConstraint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
