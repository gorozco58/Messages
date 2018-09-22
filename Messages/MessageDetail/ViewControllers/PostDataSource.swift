//
//  PostDataSource.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

protocol PostDataSourceDelegate: class {
    var postDetails: PostDetail { get }
}

class PostDataSource: NSObject {
    weak var delegate: PostDataSourceDelegate?
}

//MARK: -
//MARK: - UITableViewDataSource
extension PostDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let delegate = delegate else { return 0 }
        switch section {
        case 2:
            return delegate.postDetails.comments.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let delegate = delegate else { return UITableViewCell(frame: .zero) }
        switch indexPath.section {
        case 0:
            let post = delegate.postDetails.post
            let cell = tableView.dequeueReusableCell(with: PostDescriptionCell.self, forIndexPath: indexPath)
            cell.updateView(with: post)
            return cell
        case 1:
            let user = delegate.postDetails.user
            let cell = tableView.dequeueReusableCell(with: UserInformationCell.self, forIndexPath: indexPath)
            cell.updateView(with: user)
            return cell
        default:
            return UITableViewCell(frame: .zero)
        }
    }
}
