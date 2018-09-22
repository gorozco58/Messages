//
//  UITableViewExtension.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

public extension UITableView {
    
    public func registerNibForCell<T: UITableViewCell>(with cellType: T.Type) {
        register(UINib(nibName: String(describing: cellType), bundle: nil), forCellReuseIdentifier: String(describing: cellType))
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(with cellType: T.Type, forIndexPath indexPath: IndexPath) -> T {
        
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as! T
        return cell
    }
    
    public func registerNibForHeaderFooter<T: UITableViewHeaderFooterView>(with viewType: T.Type) {
        register(UINib(nibName: String(describing: viewType), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: viewType))
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(with viewType: T.Type) -> T {
        let view = self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: viewType)) as! T
        return view
    }
    
}
