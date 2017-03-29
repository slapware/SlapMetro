//
//  BridgeTableViewCell.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/26/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class BridgeTableViewCell: UITableViewCell {

    @IBOutlet weak var bridgeLabel: UILabel!
    @IBOutlet weak var bridgeStatus: UILabel!
    @IBOutlet weak var bridgeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
