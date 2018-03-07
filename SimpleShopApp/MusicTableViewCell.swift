//
//  MusicTableViewCell.swift
//  SimpleShopApp
//
//  Created by Krzysztof Lema on 07.03.2018.
//  Copyright © 2018 Krzysztof Lema. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var musicPriceLabel: UILabel!
    @IBOutlet weak var musicAuthorLabel: UILabel!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicImageView: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
