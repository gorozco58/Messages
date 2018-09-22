//
//  PostDescriptionCell.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class PostDescriptionCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        titleLabel.text = LocalizedString.description.localize()
    }
    
    func updateView(with information: TitleBodyType) {
        descriptionLabel.text = information.body
    }
}
