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

//MARK: - UITableViewDataSource
extension PostDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
            let comment = delegate.postDetails.comments[indexPath.row]
            let cell = tableView.dequeueReusableCell(with: CommentCell.self, forIndexPath: indexPath)
            cell.updateView(with: comment.body, isMock: comment.isMock)
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension PostDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 2 ? 40 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 2:
            let headerView = tableView.dequeueReusableHeaderFooterView(with: CommentsHeaderView.self)
            headerView.updateView(with: LocalizedString.comments.localize())
            return headerView
        default:
            return nil
        }
    }
}
