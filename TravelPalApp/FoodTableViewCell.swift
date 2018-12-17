//
//  FooodTableViewCell.swift
//  TravelPalApp
//
//  Created by Arman Chauhan on 12/16/18.
//  Copyright © 2018 jordyn hollingsworth. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodCellView: UIView!
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
