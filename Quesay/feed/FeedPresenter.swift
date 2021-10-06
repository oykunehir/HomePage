//
//  FeedPresenter.swift
//  Quesay
//
//  Created by oyku suyun on 5.10.2021.
//

import Foundation

protocol FeedProtocol {
    func onLoading()
    func onLoaded(feeds: [FeedModel])
    
    func onPostLiked(postId: Int, feedData: FeedModel)
    func onPostDisliked(postId: Int, feedData: FeedModel)
}

class FeedPresenter {
    
    private var feedView: FeedProtocol!
    public var dataManager: LocalDataManager!
    
    
    init() {
        feedView = nil
        dataManager = LocalDataManager()
    }
    
    func attachView(view: FeedProtocol) {
        self.feedView = view
    }
    
    func detachView() {
        self.feedView = nil
    }
    
    func onLoading() {
        feedView.onLoading()
        LocalDataManager.fetchData(completion: { fetchedData in

            DispatchQueue.main.async {
                self.feedView.onLoaded(feeds: fetchedData)
            }
            
        })
    }
    
    func likePost(postId: Int) {
        
        LocalDataManager.likePost(postId: postId, completion: { result in
            self.feedView.onPostLiked(postId: postId, feedData: result)
        })
        
    }
    
    func unlikePost(postId: Int) {
        
        LocalDataManager.unlikePost(postId: postId, completion: { result in
            self.feedView.onPostDisliked(postId: postId, feedData: result)
        })
    }
    
}
