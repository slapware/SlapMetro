//
//  LirrTableViewCell.swift
//  SlapMetro
//
//  Created by Stephen La Pierre on 3/21/17.
//  Copyright © 2017 Stephen La Pierre. All rights reserved.
//

import UIKit

class LirrTableViewCell: UITableViewCell {

    @IBOutlet weak var LineStatus: UILabel!
    @IBOutlet weak var LineLabel: UILabel!
    @IBOutlet weak var LineImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
