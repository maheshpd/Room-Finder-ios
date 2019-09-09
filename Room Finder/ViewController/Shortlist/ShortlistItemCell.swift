//
//  ShortlistItemCell.swift
//  Room Finder
//
//  Created by Mahesh Prasad on 10/09/19.
//  Copyright © 2019 CreatesApps. All rights reserved.
//

import UIKit

class ShortlistItemCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
   
    @IBOutlet weak var roomImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = CGFloat(7.0)
        mainView.layer.shadowRadius = 0.3
        mainView.layer.shadowOpacity = 0.3
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
