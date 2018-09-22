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
    private let performActionSubject = PublishSubject<HomePostsAction>()
    
    init(interactor: HomeInteractorType, routing: Routing) {
        self.interactor = interactor
        self.routing = routing
    }
}

//MARK - HomePresenterType
extension HomePresenter: HomePresenterType {
    
    var onPerformAction: Observable<HomePostsAction> {
        return performActionSubject.asObservable()
    }
    
    func showHomeView() {
        handleTransition(transition: .showHome(presenter: self))
    }
    
    func searchAllPosts() {
        interactor
            .searchAllPosts()
            .delay(5, scheduler: MainScheduler.instance)//uncomment for test loading views
            .startWith(interactor.createLoadingPosts())
            .subscribe(onNext: {
                self.interactor.updatePosts($0)
                self.performActionSubject.onNext(.reloadData)
            })
            .disposed(by: disposeBag)
    }
    
    func reloadPosts() {
        searchAllPosts()
    }
}

//MARK: - PostsDataSourceDelegate
extension HomePresenter: PostsDataSourceDelegate {
    
    func getPosts(with postType: PostType) -> [Post] {
        return interactor.getPosts(with: postType)
    }
    
    func postSelected(_ post: Post) {
        interactor.markPostAsRead(post)
        handleTransition(transition: .showPostDetail(post: post))
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
