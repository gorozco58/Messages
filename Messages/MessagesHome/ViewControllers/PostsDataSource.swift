//
//  PostsDataSource.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

protocol PostsDataSourceDelegate: class {
    func getPosts(with postType: PostType) -> [Post]
}

class PostsDataSource: NSObject {
    var postsType: PostType = .normal
    weak var delegate: PostsDataSourceDelegate?
}

//MARK: - UITableViewDataSource
extension PostsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getPosts(with: postsType).count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(frame: .zero)
    }
    
    
}


