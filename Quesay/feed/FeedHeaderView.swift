//
//  FeedHeaderView.swift
//  Quesay
//
//  Created by oyku suyun on 5.10.2021.
//

import Foundation
import UIKit

class FeedHeaderView: UITableViewHeaderFooterView {
    
    var stackView: UIStackView!
    var headerDelegate: LikeButtonProtocol!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        
        stackView = UIStackView(frame: self.frame)
        stackView.backgroundColor = .white
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        let countryLabel = UILabel()
        countryLabel.text = "Turkey"
        countryLabel.textAlignment = .center
        countryLabel.font = UIFont.boldSystemFont(ofSize: 24)
        countryLabel.textColor = .darkGray
        
        let ageLabel = UILabel()
        ageLabel.text = "23"
        ageLabel.textAlignment = .center
        ageLabel.font = UIFont.boldSystemFont(ofSize: 24)
        ageLabel.textColor = .darkGray
        
        let showMy = UIButton()
        showMy.setTitle("POSTS", for: .normal)
        showMy.setTitleColor(.black, for: .normal)
        showMy.addTarget(self, action: #selector(showMyPosts(sender:)), for: .touchUpInside)
        
        let showLiked = UIButton()
        showLiked.setTitle("LIKED", for: .normal)
        showLiked.setTitleColor(.black, for: .normal)
        showLiked.addTarget(self, action: #selector(showLikedPosts(sender:)), for: .touchUpInside)
        
        stackView.addArrangedSubview(countryLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.addArrangedSubview(showMy)
        stackView.addArrangedSubview(showLiked)
        
        self.addSubview(stackView)
    }
    
    @objc func showLikedPosts(sender: UIButton) {
        headerDelegate.showLikedPosts()
    }
    
    @objc func showMyPosts(sender: UIButton) {
        headerDelegate.showMyPosts()
    }
}
