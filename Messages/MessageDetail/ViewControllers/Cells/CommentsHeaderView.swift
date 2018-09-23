//
//  CommentsHeaderView.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class CommentsHeaderView: UITableViewHeaderFooterView {

    @IBOutlet private weak var titleLabel: UILabel!

    func updateView(with text: String) {
        titleLabel.text = text
    }
}
