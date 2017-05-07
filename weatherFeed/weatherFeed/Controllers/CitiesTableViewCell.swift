//
//  CitiesTableViewCell.swift
//  weatherFeed
//
//  Created by Ihonahan Buitrago on 5/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    @IBOutlet weak var fullContainer: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    static let identifier = "CitiesCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
