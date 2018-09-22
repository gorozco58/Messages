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
        
}

//MARK: - HomeInteractorType
extension HomeInteractor: HomeInteractorType {
    
    func searchAllPosts() -> Single<[Post]> {
        return Single.create { observer in
            Alamofire.request(ServiceUrl.allPosts).responseJSON { response in
                switch response.result {
                case .success(let json as [[AnyHashable : Any]]):
                    do {
                        let post: [Post] = try JSONDecoder.array(with: json)
                        observer(.success(post))
                    } catch {
                        print(error)
                        observer(.error(error))
                    }
                case .failure(let error):
                    observer(.error(error))
                default:
                    observer(.error(RxError.unknown))
                }
            }
            return Disposables.create()
        }
    }
}
