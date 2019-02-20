//
//  NoticeListTableViewCell.swift
//  SWUTotalInfoSystem
//
//  Created by 박주현 on 29/01/2019.
//  Copyright © 2019 박주현. All rights reserved.
//

import UIKit

class NoticeListTableViewCell: UITableViewCell {
    
    // MARk:- IBOulet
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var writerLabel: UILabel!
    @IBOutlet var postDateLabel: UILabel!
    @IBOutlet var fileImageVIew: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
