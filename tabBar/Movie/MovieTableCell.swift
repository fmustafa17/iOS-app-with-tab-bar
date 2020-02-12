//
//  MovieTableCell.swift
//  tabBar
//
//  Created by Farhana Mustafa on 2/11/20.
//  Copyright © 2020 Farhana Mustafa. All rights reserved.
//

import UIKit

class MovieTableCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDirectorLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateData(model: Movie) {
        movieTitleLabel.text = model.title
        movieDirectorLabel.text = model.director
        movieDescriptionLabel.text = model.description
    }

}
