//
//  HomePresenter.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxSwift

class HomePresenter<Routing: RoutingType> where Routing.Transition == MainTransition {
    private let interactor: HomeInteractorType
    private let routing: Routing
    private let disposeBag = DisposeBag()
    
    init(interactor: HomeInteractorType, routing: Routing) {
        self.interactor = interactor
        self.routing = routing
    }
}

//MARK - HomePresenterType
extension HomePresenter: HomePresenterType {
    
    func showHomeView() {
        handleTransition(transition: .showHome(presenter: self))
    }
    
    func searchAllPosts() {
        interactor
            .searchAllPosts()
            .subscribe(onSuccess: { [unowned self] in
                self.interactor.updatePosts($0)
            })
            .disposed(by: disposeBag)
    }
    
    func reloadPosts() {
        searchAllPosts()
    }
}

//MARK: - Private methods
private extension HomePresenter {
    
    func handleTransition(transition: MainTransition, onCompletion complete: RoutingType.CompletionBlock? = nil) {
        do {
            try routing.performTransition(transition: transition, onCompletion: complete)
        } catch {
            print("Error trying to handle transition: \(transition)")
        }
    }
}
