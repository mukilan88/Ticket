//
//  MovieTableCell.swift
//  Ticket
//
//  Created by AruniOS on 03/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit

class MovieTableCell: UITableViewCell {
   
    @IBOutlet var Name: UILabel!
    @IBOutlet var UName: UILabel!
    @IBOutlet var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
