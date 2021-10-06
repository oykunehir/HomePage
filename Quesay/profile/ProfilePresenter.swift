//
//  ProfilePresenter.swift
//  Quesay
//
//  Created by oyku suyun on 5.10.2021.
//

import Foundation

protocol ProfileProtocol {
    func onProfileLoading()
    func onProfileLoaded(myPosts: [FeedModel])
    func onLikedLoaded(likedFeed: [FeedModel])
}


class ProfilePresenter {
    
    var profileView: ProfileProtocol!
    var dataManager: LocalDataManager!
    
    init() {
        profileView = nil
        dataManager = LocalDataManager()
    }
    
    func attachView(view: ProfileProtocol) {
        self.profileView = view
    }
    
    func detachView() {
        self.profileView = nil
    }
    
    func fetchMyPosts() {
        profileView.onProfileLoading()
        LocalDataManager.fetchMyPosts(completion: { myPosts in

            DispatchQueue.main.async {
                self.profileView.onProfileLoaded(myPosts: myPosts)
            }
            
        })
    }
    
    func fetchLikedPosts() {
        LocalDataManager.fetchLikedData(completion: { likedData in
            
            DispatchQueue.main.async {
                self.profileView.onLikedLoaded(likedFeed: likedData)
            }
            
        })
    }
}
