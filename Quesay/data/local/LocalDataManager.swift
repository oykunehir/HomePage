//
//  LocalDataManager.swift
//  Quesay
//
//  Created by oyku suyun on 5.10.2021.
//

import Foundation
import CoreData

struct FeedModel {
    var feedUserId: String = ""
    var feedId: String = UUID().uuidString
    var feedHeader: String!
    var feedDescription: String!
    var feedImageName: String!
    var feedUserName: String!
    var isLiked: Bool = false
}

class LocalDataManager {
    
    private static var myUID = "1"
    private static var fetchedFeedData: [FeedModel] = []
    
    static func initialize() {
        fetchedFeedData = [FeedModel(feedUserId: "1",
                                    feedHeader: Texts.header,
                                     feedDescription: Texts.description,
                                     feedImageName: Texts.imageName,
                                     feedUserName: Texts.userName),
                           FeedModel(feedUserId: "1",
                                   feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName),
                           FeedModel(feedUserId: "2",
                                   feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName2),
                           FeedModel(feedUserId: "3",
                                   feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName3),
                           FeedModel(feedUserId: "4",
                                   feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName4),
                           FeedModel(feedUserId: "1",
                                   feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName),
                           FeedModel(feedUserId: "5",
                                   feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName5),
                           FeedModel(feedUserId: "6",
                                   feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName6),
                           FeedModel(feedUserId: "1",
                                   feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName),
                           FeedModel(feedUserId: "7",
                                   feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName7),
                           FeedModel(feedUserId: "8",
                                    feedHeader: Texts.header,
                                    feedDescription: Texts.description,
                                    feedImageName: Texts.imageName,
                                    feedUserName: Texts.userName8),
       
                           ]
    }
    
    static func fetchData(completion: @escaping ([FeedModel]) -> Void) {
        completion(fetchedFeedData)
    }
    
    static func likePost(postId: Int, completion: @escaping (FeedModel) -> Void) {
        fetchedFeedData[postId].isLiked = true
        completion(fetchedFeedData[postId])
    }
    
    static func unlikePost(postId: Int, completion: @escaping (FeedModel) -> Void) {
        fetchedFeedData[postId].isLiked = false
        completion(fetchedFeedData[postId])
    }
    
    static func fetchMyPosts(completion: @escaping ([FeedModel]) -> Void) {
        let likedData = fetchedFeedData.filter { feedModel in
            return feedModel.feedUserId == myUID
        }
        
        completion(likedData)
    }
    
    static func fetchLikedData(completion: @escaping ([FeedModel]) -> Void) {

        let likedData = fetchedFeedData.filter { feedModel in
            return feedModel.isLiked == true
        }
        
        completion(likedData)
    }
    

}
