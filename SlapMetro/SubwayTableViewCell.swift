//
//  SubwayTableViewCell.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/22/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class SubwayTableViewCell: UITableViewCell {

    @IBOutlet weak var SubwayLine: UILabel!
    @IBOutlet weak var SubwayStatus: UILabel!
    @IBOutlet weak var SubwayImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
