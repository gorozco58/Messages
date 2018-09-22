//
//  HomeInteractor.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire


class HomeInteractor {
    private var allPosts: [Post] = []
    
}

//MARK: - HomeInteractorType
extension HomeInteractor: HomeInteractorType {
    
    func searchAllPosts() -> Observable<[Post]> {
        return Observable.create { observer in
            Alamofire.request(ServiceUrl.allPosts).responseJSON { response in
                switch response.result {
                case .success(let json as [[AnyHashable : Any]]):
                    do {
                        let posts: [Post] = try JSONDecoder.array(with: json)
                        posts.markAsRead(from: 20)
                        observer.onNext(posts)
                        observer.onCompleted()
                    } catch {
                        print(error)
                        observer.onError(error)
                    }
                case .failure(let error):
                    observer.onError(error)
                default:
                    observer.onError(RxError.unknown)
                }
            }
            return Disposables.create()
        }
    }
    
    func updatePosts(_ posts: [Post]) {
        allPosts = posts
    }
    
    func getPosts(with type: PostType) -> [Post] {
        return allPosts.filter { $0.postType == type }
    }
    
    func createLoadingPosts() -> [Post] {
        return [Post(), Post(), Post(), Post(), Post(), Post(), Post(), Post()]
    }
}
