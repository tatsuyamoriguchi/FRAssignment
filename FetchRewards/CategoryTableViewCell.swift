//
//  CategoryTableViewCell.swift
//  FetchRewards
//
//  Created by Tatsuya Moriguchi on 10/3/21.
//  Copyright © 2021 Tatsuya Moriguchi. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var strCategoryThumb: UIImageView!
    @IBOutlet weak var idCategoryLabel: UILabel!
    @IBOutlet weak var strCategoryLabel: UILabel!
    @IBOutlet weak var strCategoryDescriptionTextView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
