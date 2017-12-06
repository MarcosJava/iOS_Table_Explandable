//
//  ExpandableCell.swift
//  Expandable-TableView
//
//  Created by Marcos Felipe Souza Pinto on 06/12/2017.
//  Copyright © 2017 Marcos Felipe Souza Pinto. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {

    @IBOutlet weak var txtLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var imgHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var isExpanded:Bool = false {
        didSet {
            if isExpanded {
                self.imgHeightConstraint.constant = 128.0
            } else {
                self.imgHeightConstraint.constant = 0.0
            }
        }
    }

}
