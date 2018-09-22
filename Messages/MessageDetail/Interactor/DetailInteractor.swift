//
//  DetailInteractor.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class DetailInteractor {
 
    private(set) var postDetail: PostDetail
    private var post: Post {
        return postDetail.post
    }
    
    init(post: Post) {
        self.postDetail = PostDetail(post: post, user: User(), comments: [Comment(), Comment(), Comment()])
    }
}

//MARK: - DetailInteractorType
extension DetailInteractor: DetailInteractorType {
    
    func updatePostStatus() {
        post.postType = post.postType == .normal ? .favorite : .normal
    }
    
    func searchPostUserOwner() -> Observable<User> {
        let userId = post.userId
        return Observable.create { observer in
            Alamofire.request(ServiceUrl.user(id: userId)).responseJSON { response in
                switch response.result {
                case .success(let json as [AnyHashable : Any]):
                    do {
                        let user: User = try JSONDecoder.model(with: json)
                        observer.onNext(user)
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
    
    func searchPostComments() -> Observable<[Comment]> {
        let postId = post.postId
        return Observable.create { observer in
            Alamofire.request(ServiceUrl.comments(postId: postId)).responseJSON { response in
                switch response.result {
                case .success(let json as [[AnyHashable : Any]]):
                    do {
                        let comments: [Comment] = try JSONDecoder.array(with: json)
                        observer.onNext(comments)
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
    
    func updateUser(_ user: User) {
        postDetail.user = user
    }
    
    func updateComments(_ comments: [Comment]) {
        postDetail.comments = comments
    }
}
