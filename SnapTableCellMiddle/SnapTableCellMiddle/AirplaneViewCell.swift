//
//  AirplaneViewCell.swift
//  SnapTableCellMiddle
//
//  Created by Aleksandr Aniskin on 08.04.2021.
//

import UIKit

class AirplaneViewCell: UITableViewCell {

    @IBOutlet weak var airplaneImageView: UIImageView!
    @IBOutlet weak var airplaneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
