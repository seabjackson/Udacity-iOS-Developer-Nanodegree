//
//  MemeTableViewCell.swift
//  MemeMe
//
//  Created by lily on 7/10/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
