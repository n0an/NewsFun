//
//  ArticleCell.swift
//  NewsFun
//
//  Created by nag on 03/06/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
