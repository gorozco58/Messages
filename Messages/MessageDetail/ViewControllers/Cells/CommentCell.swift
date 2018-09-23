//
//  CommentCell.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private var loaderViews: [GradientLoaderView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func updateView(with comment: String, isMock: Bool) {
        configureLoadingViews(loading: isMock)
        commentLabel.text = comment
    }
    
    private func configureLoadingViews(loading isLoading: Bool = true) {
        guard let loadingViews = loaderViews, !loadingViews.isEmpty else {
            return
        }
        loadingViews.forEach {
            $0.isHidden = !isLoading
            isLoading ? () : $0.gradientView.reset()
        }
        
        if isLoading {
            loadingViews.syncronize()
        }
    }
}
