//
//  ProfileControllerViewController.swift
//  Quesay
//
//  Created by oyku suyun on 5.10.2021.
//

import UIKit

enum ViewMode {
    case liked
    case myPosts
}

class ProfileControllerViewController: UIViewController {

    var profileFeedTableView: FeedTableView!
    var profilePresenter: ProfilePresenter!
    var profileLikedFeed: [FeedModel] = []
    var profilePostsFeed: [FeedModel] = []
    var viewMode: ViewMode = .myPosts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavBar()
        initPresenter()
        initTableView()
    }
    
    private func initNavBar() {
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        self.navigationController!.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.title = "Lorem Ipsum"
    }
    
    private func initPresenter() {
        profilePresenter = ProfilePresenter()
        profilePresenter.attachView(view: self)
        profilePresenter.fetchMyPosts()
    }
    
    private func initTableView() {
        profileFeedTableView = FeedTableView()
        profileFeedTableView.delegate = self
        profileFeedTableView.dataSource = self
        profileFeedTableView.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1)
        profileFeedTableView.register(FeedCell.self, forCellReuseIdentifier: "feedCell")
        profileFeedTableView.register(FeedHeaderView.self, forHeaderFooterViewReuseIdentifier: "feedHeader")
    
        self.view.addSubview(profileFeedTableView)
        
        profileFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        profileFeedTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileFeedTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        profileFeedTableView.bottomAnchor
            .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        profileFeedTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
}

extension ProfileControllerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if viewMode == .liked {
            return self.profileLikedFeed.count
        } else {
            return self.profilePostsFeed.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileFeedTableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedCell
        
        if viewMode == .liked {
            cell.configureCell(cellData: self.profileLikedFeed[indexPath.row], cellIndex: indexPath.row, isHidden: true)
        } else {
            cell.configureCell(cellData: self.profilePostsFeed[indexPath.row], cellIndex: indexPath.row, isHidden: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = self.profileFeedTableView.dequeueReusableHeaderFooterView(withIdentifier: "feedHeader") as! FeedHeaderView
        headerView.configure()
        headerView.headerDelegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.5
    }
    
}

extension ProfileControllerViewController: ProfileProtocol {
    func onProfileLoading() {
        self.profilePostsFeed = []
        self.profileLikedFeed = []
        DispatchQueue.main.async {
            self.profileFeedTableView.reloadData()
        }
    }
    
    func onProfileLoaded(myPosts: [FeedModel]) {
        self.viewMode = .myPosts
        self.profilePostsFeed = myPosts
        self.profileFeedTableView.reloadData()
    }
    
    func onLikedLoaded(likedFeed: [FeedModel]) {
        self.viewMode = .liked
        self.profileLikedFeed = likedFeed
        self.profileFeedTableView.reloadData()
    }
    
    
}

extension ProfileControllerViewController: LikeButtonProtocol {
    func unlikePost(postId: Int) {
        //
    }
    
    func likePost(postId: Int) {
        //
    }
    
    func showLikedPosts() {
        print("SHOWING LIKED POSTS")
        self.viewMode = .liked
        self.profilePresenter.fetchLikedPosts()
    }
    
    func showMyPosts() {
        print("SHOWING MY POSTS")
        self.viewMode = .myPosts
        self.profilePresenter.fetchMyPosts()
    }
    
}
