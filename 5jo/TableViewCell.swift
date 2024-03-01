//
//  TableViewCell.swift
//  5jo
//
//  Created by imhs on 2/29/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var nameImageView: UIImageView!  //프사
    @IBOutlet weak var nameLabel: UILabel!  //이름
    @IBOutlet weak var roleLable: UILabel!  //역할
    @IBOutlet weak var mbtiLabel: UILabel!  //MBTI
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
