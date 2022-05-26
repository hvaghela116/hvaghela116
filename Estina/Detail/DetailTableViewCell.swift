//
//  DetailTableViewCell.swift
//  Estina
//
//  Created by Hitesh Vaghela on 03/02/21.
//  Copyright © 2021 Hitesh Vaghela. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"
    @IBOutlet weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(data: String?) {
        valueLabel.text = data ?? ""
    }
}
