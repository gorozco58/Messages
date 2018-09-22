//
//  PostInformationCell.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class PostInformationCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var readPointView: UIView!
    @IBOutlet private weak var loadersContainerView: UIView!
    @IBOutlet private var loaderViews: [GradientLoaderView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func updateView(with info: Mockable & TitleBodyType) {
        configureLoadingViews(loading: info.isMock)
        titleLabel.text = info.title
        descriptionLabel.text = info.body
        markAsRead(isRead: info.isRead)
    }
    
    func markAsRead(isRead: Bool) {
        readPointView.isHidden = isRead
    }
    
    private func configureLoadingViews(loading isLoading: Bool = true) {
        guard let loadingViews = loaderViews, !loadingViews.isEmpty else {
            return
        }
        loadersContainerView.isHidden = !isLoading
        loadingViews.forEach {
            $0.isHidden = !isLoading
            isLoading ? () : $0.gradientView.reset()
        }
        
        if isLoading {
            loadingViews.syncronize()
        }
    }
}
