//
//  TheaterMovieCell.swift
//  Ticket
//
//  Created by AruniOS on 19/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit

class TheaterMovieCell: UITableViewCell {

    @IBOutlet weak var theaterMovieNameCell: UILabel!
    @IBOutlet weak var theaterMovieAddCell: UILabel!
    @IBOutlet weak var theaterMovieTimeCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
