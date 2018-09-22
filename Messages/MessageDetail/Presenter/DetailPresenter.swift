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
    private let performActionSubject = PublishSubject<DetailPostAction>()
    
    init(interactor: DetailInteractorType, routing: Routing) {
        self.interactor = interactor
        self.routing = routing
    }
}

//MARK: - DetailPresenterType
extension DetailPresenter: DetailPresenterType {
    
    var onPerformAction: Observable<DetailPostAction> {
        return performActionSubject.asObservable()
    }
    
    var isFavorite: Bool {
        return interactor.postDetail.post.postType == .favorite
    }
    
    func showPostDetailView() {
        handleTransition(transition: .showDetail(presenter: self))
    }
    
    func updatePostStatus() {
        interactor.updatePostStatus()
    }
    
    func loadPostDetails() {
        interactor
            .searchPostUserOwner()
            .subscribe(onNext: { [unowned self] in
                self.interactor.updateUser($0)
                self.performActionSubject.onNext(.reloadData)
            })
            .disposed(by: disposeBag)
        
        interactor
            .searchPostComments()
            .subscribe(onNext: { [unowned self] in
                self.interactor.updateComments($0)
                self.performActionSubject.onNext(.reloadData)
            })
            .disposed(by: disposeBag)
    }
}

//MARK: - PostDataSourceDelegate
extension DetailPresenter: PostDataSourceDelegate {
    
    var postDetails: PostDetail {
        return interactor.postDetail
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
