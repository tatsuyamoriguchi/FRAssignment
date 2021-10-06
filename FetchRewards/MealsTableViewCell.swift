//
//  MealsTableViewCell.swift
//  FetchRewards
//
//  Created by Tatsuya Moriguchi on 10/5/21.
//  Copyright © 2021 Tatsuya Moriguchi. All rights reserved.
//

import UIKit

class MealsTableViewCell: UITableViewCell {

    @IBOutlet weak var strMealThumbImageView: UIImageView!
    @IBOutlet weak var idMealLabel: UILabel!
    @IBOutlet weak var strMealLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
