//
//  DetailViewController.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let presenter: DetailPresenterType
    
    init(presenter: DetailPresenterType) {
        self.presenter = presenter
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
