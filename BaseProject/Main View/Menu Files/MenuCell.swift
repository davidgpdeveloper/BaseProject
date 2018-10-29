//
//  MenuCell.swift
//  trasladiaUser
//
//  Created by David Galán on 08/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var labelOptionMenu: UILabel!
    @IBOutlet weak var viewAlertCounter: UIView! {
        didSet {
            viewAlertCounter.layer.cornerRadius = 10
            viewAlertCounter.isHidden = true
        }
    }
    @IBOutlet weak var labelCounter: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
