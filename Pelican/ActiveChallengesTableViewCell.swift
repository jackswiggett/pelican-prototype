//
//  ActiveChallengesTableViewCell.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/9/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit

class ActiveChallengesTableViewCell: UITableViewCell {

    @IBOutlet weak var challengeTypeIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        challengeTypeIcon.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
