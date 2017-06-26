//
//  ChatCell.swift
//  parse_chat
//
//  Created by Cameryn Boyd on 6/26/17.
//  Copyright © 2017 Cameryn Boyd. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    @IBOutlet weak var messageDisplay: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
