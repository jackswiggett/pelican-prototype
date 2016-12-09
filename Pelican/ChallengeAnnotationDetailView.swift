//
//  ChallengeAnnotationDetailView.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/8/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

internal let upwardOffset: CGFloat = 25 // offset to fill the space occupied by the annotation title, which is equal to " " (title cannot be nil or the callout will not load)
internal let textWidth: CGFloat = 100
internal let pointsWidth: CGFloat = 55
internal let labelFont = UIFont.systemFont(ofSize: 15)
internal let buttonMarginTop: CGFloat = 15
internal let buttonWidth: CGFloat = 110
internal let buttonHeight: CGFloat = 35
internal let buttonCornerRadius: CGFloat = 10
internal let sideMargin: CGFloat = 5
internal let bottomMargin: CGFloat = 5

class ChallengeAnnotationDetailView: UIView {

    init(challengeAnnotation annotation: ChallengeAnnotation) {
        super.init(frame: CGRect.zero)
        
        let textLabel = UILabel(frame: CGRect.zero)
        textLabel.numberOfLines = 0
        textLabel.text = annotation.challenge.name
        textLabel.font = labelFont
        let textNeededSize = textLabel.sizeThatFits(CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude))
        textLabel.frame = CGRect(x: sideMargin, y: -1 * upwardOffset, width: textWidth, height: textNeededSize.height)
        
        let pointsLabel = UILabel(frame: CGRect(x: sideMargin + textWidth, y: -1 * upwardOffset, width: pointsWidth, height: textNeededSize.height))
        pointsLabel.numberOfLines = 0
        pointsLabel.text = String(annotation.challenge.points) + " pts"
        pointsLabel.font = labelFont
        pointsLabel.textAlignment = .right
        
        let buttonX = (sideMargin * 2 + textWidth + pointsWidth - buttonWidth) / 2
        let buttonY = textNeededSize.height + buttonMarginTop - upwardOffset
        let button = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight))
        button.setTitle("Let's do it!", for: .normal)
        button.titleLabel?.font = labelFont
        button.backgroundColor = Constants.pelicanColor
        button.layer.cornerRadius = buttonCornerRadius;
        button.clipsToBounds = true;
        
        self.addSubview(textLabel)
        self.addSubview(pointsLabel)
        self.addSubview(button)
        
        let widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: sideMargin * 2 + textWidth + pointsWidth)
        
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: textNeededSize.height + buttonMarginTop + buttonHeight + bottomMargin - upwardOffset)
        
        self.addConstraint(heightConstraint)
        self.addConstraint(widthConstraint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
