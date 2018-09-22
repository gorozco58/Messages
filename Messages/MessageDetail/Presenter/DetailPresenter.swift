//
//  DetailPresenter.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxSwift

class DetailPresenter <Routing: RoutingType> where Routing.Transition == DetailTransition {
    private let interactor: DetailInteractorType
    private let routing: Routing
    private let disposeBag = DisposeBag()
    private let performActionSubject = PublishSubject<HomePostsAction>()
    
    init(interactor: DetailInteractorType, routing: Routing) {
        self.interactor = interactor
        self.routing = routing
    }
}

//MARK: - DetailPresenterType
extension DetailPresenter: DetailPresenterType {
    
    var isFavorite: Bool {
        return interactor.post.postType == .favorite
    }
    
    func showPostDetailView() {
        handleTransition(transition: .showDetail(presenter: self))
    }
    
    func updatePostStatus() {
        interactor.updatePostStatus()
    }
}

//MARK: - Private methods
private extension DetailPresenter {
    
    func handleTransition(transition: DetailTransition, onCompletion complete: RoutingType.CompletionBlock? = nil) {
        do {
            try routing.performTransition(transition: transition, onCompletion: complete)
        } catch {
            print("Error trying to handle transition: \(transition)")
        }
    }
}
