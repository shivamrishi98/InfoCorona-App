//
//  mythTableViewCell.swift
//  InfoCorona
//
//  Created by Shivam Rishi on 26/03/20.
//  Copyright © 2020 Shivam Rishi. All rights reserved.
//

import UIKit

class mythTableViewCell: UITableViewCell {

    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var infoImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
