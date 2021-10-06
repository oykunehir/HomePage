//
//  ViewController.swift
//  Quesay
//
//  Created by oyku suyun on 5.10.2021.
//

import UIKit


class FeedController: UIViewController {

    var feedTableView: UITableView!
    var feedPresenter: FeedPresenter!
    var mainFeed: [FeedModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1)
        
        LocalDataManager.initialize()
        
        initTableView()
        
        feedPresenter = FeedPresenter()
        feedPresenter.attachView(view: self)
        feedPresenter.onLoading()
    }
    
    private func initTableView() {
        feedTableView = UITableView()
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1)
        feedTableView.register(FeedCell.self, forCellReuseIdentifier: "feedCell")
        feedTableView.separatorStyle = .none
        feedTableView.separatorEffect = .none
        
        
        self.view.addSubview(feedTableView)
        
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        feedTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        feedTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        feedTableView.bottomAnchor
            .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        feedTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
}

extension FeedController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedCell
        cell.cellDelegate = self
        cell.configureCell(cellData: self.mainFeed[indexPath.row], cellIndex: indexPath.row, isHidden: false)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.5
    }
    
    
    func calculateHeight(inString:String) -> CGFloat{
        let messageString = inString
        let attributes = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0)]
        let attributedString : NSAttributedString = NSAttributedString(string: messageString, attributes: attributes)
        let rect : CGRect = attributedString.boundingRect(with: CGSize(width: 222.0, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        let requredSize:CGRect = rect
        return requredSize.height
    }
}
    

extension FeedController: FeedProtocol {
    
    func onLoading() {
        self.mainFeed = []
    }
    
    func onLoaded(feeds: [FeedModel]) {
        self.mainFeed = feeds
        self.feedTableView.reloadData()
    }
    
    func onPostLiked(postId: Int, feedData: FeedModel) {
        print("POST \(postId) LIKED")
        self.mainFeed[postId] = feedData
        DispatchQueue.main.async {
            let cell = self.feedTableView.cellForRow(at: IndexPath(row: postId, section: 0)) as! FeedCell
            cell.changeButtonTitle(cellData: self.mainFeed[postId])
        }
    }
    
    func onPostDisliked(postId: Int, feedData: FeedModel) {
        print("POST \(postId) DISLIKED")
        self.mainFeed[postId] = feedData
        DispatchQueue.main.async {
            let cell = self.feedTableView.cellForRow(at: IndexPath(row: postId, section: 0)) as! FeedCell
            cell.changeButtonTitle(cellData: self.mainFeed[postId])
        }
    }
    
    
}

extension FeedController: LikeButtonProtocol {
    func showLikedPosts() {
        //
    }
    
    func showMyPosts() {
        //
    }
    
    func likePost(postId: Int) {
        feedPresenter.likePost(postId: postId)
    }
    
    func unlikePost(postId: Int) {
        feedPresenter.unlikePost(postId: postId)
    }
}
