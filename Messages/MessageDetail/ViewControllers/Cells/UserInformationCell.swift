//
//  UserInformationCell.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class UserInformationCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private var loaderViews: [GradientLoaderView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = LocalizedString.user.localize()
    }

    func updateView(with information: Mockable & UserInformationType) {
        configureLoadingViews(loading: information.isMock)
        nameLabel.text = information.name
        emailLabel.text = information.email
        phoneLabel.text = information.phone
        websiteLabel.text = information.website
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
