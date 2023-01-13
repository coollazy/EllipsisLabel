//
//  TableViewCell.swift
//  ExampleEllipsisLabel
//
//  Created by User on 2023/1/13.
//

import UIKit
import EllipsisLabel

class TableViewCell: UITableViewCell {
    @IBOutlet weak var label: EllipsisLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        label.lineBreakMode = .byClipping
        label.font = .systemFont(ofSize: 17)
        label.textColor = .darkGray
        label.numberOfLines = 5
        label.ellipsis = "...全文"
        label.ellipsisColor = .blue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
