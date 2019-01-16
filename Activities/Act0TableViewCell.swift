//
//  Act0TableViewCell.swift
//  Activities
//
//  Created by User21 on 2019/1/13.
//  Copyright © 2019 Chiafishh. All rights reserved.
//

import UIKit

class Act0TableViewCell: UITableViewCell {

    @IBOutlet var actImg: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
