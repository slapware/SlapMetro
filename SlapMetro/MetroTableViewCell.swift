//
//  MteroTableViewCell.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/25/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class MetroTableViewCell: UITableViewCell {
    @IBOutlet weak var metroLabel: UILabel!
    @IBOutlet weak var metroStatus: UILabel!
    @IBOutlet weak var metroImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
