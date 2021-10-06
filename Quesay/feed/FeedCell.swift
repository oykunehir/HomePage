//
//  FeedCell.swift
//  Quesay
//
//  Created by oyku suyun on 5.10.2021.
//

import Foundation
import UIKit

class FeedCell: UITableViewCell {
    let padding = 20
    
    var cellBaseView: UIView!
    var cellImageView: UIImageView!
    
    var cellDetailBaseView: UIView!
    var cellUserNameLabel: UILabel!
    var cellDetailTextView: UITextView!
    var cellHeaderLabelView: UILabel!
    var cellLikeButton: UIButton!
    
    var cellDelegate: LikeButtonProtocol!
    var cellInd: Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
        self.contentView.frame = frame
        self.frame = frame
        self.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1)
        let v = UIView()
        v.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1)
        self.selectedBackgroundView = v
        self.isUserInteractionEnabled = true
        
        initializeCellBaseView()
        initializeImageView()
        initializeDetailBaseView()
        initializeDetailHeaderView()
        initializeUsernameLabel()
        initializeDetailDescriptionView()
        initializeLikeButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(cellData: FeedModel, cellIndex: Int, isHidden: Bool) {
        cellUserNameLabel.text = cellData.feedUserName
        cellDetailTextView.text = cellData.feedDescription
        cellHeaderLabelView.text = cellData.feedHeader
        cellImageView.image = UIImage(named: cellData.feedImageName)
        cellInd = cellIndex
        
        cellLikeButton.isHidden = isHidden
    }
 
}

// Temporary init functions
extension FeedCell {
    
    func initializeCellBaseView() {
        cellBaseView = UIView()
        cellBaseView.backgroundColor = UIColor.init(red: 229/255.0, green: 229/255.0, blue: 234/255.0, alpha: 1)
        cellBaseView.layer.cornerRadius = 8
        self.addSubview(cellBaseView)
        
        cellBaseView.translatesAutoresizingMaskIntoConstraints = false
        cellBaseView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        cellBaseView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        cellBaseView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        cellBaseView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    func initializeImageView() {
        cellImageView = UIImageView()
        cellImageView.contentMode = .scaleToFill
        cellImageView.image = UIImage(named: "illustration")
        cellImageView.layer.cornerRadius = frame.width / 20
        self.cellImageView.clipsToBounds = true
        cellBaseView.addSubview(cellImageView)
        
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.leftAnchor.constraint(equalTo: cellBaseView.leftAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: cellBaseView.topAnchor).isActive = true
        cellImageView.rightAnchor.constraint(equalTo: cellBaseView.rightAnchor).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: cellBaseView.bottomAnchor).isActive = true
    }
    
    func initializeDetailBaseView() {
        
        cellDetailBaseView = UIView()
        cellDetailBaseView.backgroundColor = .white
        cellDetailBaseView.layer.cornerRadius = frame.width / 20
        cellDetailBaseView.backgroundColor = .white
        cellDetailBaseView.layer.shadowColor = UIColor.black.cgColor
        cellDetailBaseView.layer.shadowOpacity = 0.5
        cellDetailBaseView.layer.shadowOffset = .zero
        cellDetailBaseView.layer.shadowRadius = 10
        cellBaseView.addSubview(cellDetailBaseView)
        
        cellDetailBaseView.translatesAutoresizingMaskIntoConstraints = false
        cellDetailBaseView.leftAnchor.constraint(equalTo: cellBaseView.leftAnchor).isActive = true
        cellDetailBaseView.topAnchor.constraint(equalTo: cellBaseView.centerYAnchor, constant: -70).isActive = true
        cellDetailBaseView.rightAnchor.constraint(equalTo: cellBaseView.rightAnchor).isActive = true
        cellDetailBaseView.bottomAnchor.constraint(equalTo: cellBaseView.bottomAnchor).isActive = true
    }
    
    func initializeDetailHeaderView() {
        cellHeaderLabelView = UILabel()
        cellHeaderLabelView.textColor = .black
        cellHeaderLabelView.font = UIFont.boldSystemFont(ofSize: 22)
        cellHeaderLabelView.text = ""
        cellDetailBaseView.addSubview(cellHeaderLabelView)
        
        cellHeaderLabelView.translatesAutoresizingMaskIntoConstraints = false
        cellHeaderLabelView.topAnchor.constraint(equalTo: cellDetailBaseView.topAnchor, constant: 10).isActive = true
        cellHeaderLabelView.leftAnchor.constraint(equalTo: cellDetailBaseView.leftAnchor, constant: 10).isActive = true
        cellHeaderLabelView.rightAnchor.constraint(equalTo: cellDetailBaseView.rightAnchor, constant: -10).isActive = true
        cellHeaderLabelView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func initializeUsernameLabel() {
        cellUserNameLabel = UILabel()
        cellUserNameLabel.textColor = .black
        cellUserNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        cellUserNameLabel.text = ""
        cellUserNameLabel.textAlignment = .right
        cellDetailBaseView.addSubview(cellUserNameLabel)
        
        cellUserNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cellUserNameLabel.bottomAnchor.constraint(equalTo: cellDetailBaseView.bottomAnchor, constant: -10).isActive = true
        cellUserNameLabel.rightAnchor.constraint(equalTo: cellDetailBaseView.rightAnchor, constant: -10).isActive = true
        cellUserNameLabel.leftAnchor.constraint(equalTo: cellDetailBaseView.leftAnchor, constant: 10).isActive = true
        cellUserNameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func initializeDetailDescriptionView() {
        cellDetailTextView = UITextView()
        cellDetailTextView.textColor = .darkGray
        cellDetailTextView.font = UIFont.systemFont(ofSize: 16)
        cellDetailTextView.text = ""
        cellDetailTextView.isEditable = false
        cellDetailBaseView.addSubview(cellDetailTextView)
        
        cellDetailTextView.translatesAutoresizingMaskIntoConstraints = false
        cellDetailTextView.topAnchor.constraint(equalTo: cellHeaderLabelView.bottomAnchor, constant: 8).isActive = true
        cellDetailTextView.rightAnchor.constraint(equalTo: cellDetailBaseView.rightAnchor, constant: -10).isActive = true
        cellDetailTextView.leftAnchor.constraint(equalTo: cellDetailBaseView.leftAnchor, constant: 10).isActive = true
        cellDetailTextView.bottomAnchor.constraint(equalTo: cellUserNameLabel.topAnchor, constant: -4).isActive = true
    }
    
    func initializeLikeButton() {
        
        cellLikeButton = UIButton()
        cellLikeButton.setTitle("LIKE", for: .normal)
        cellLikeButton.setTitleColor(.lightGray, for: .normal)
        cellLikeButton.backgroundColor = .white
        cellLikeButton.layer.shadowColor = UIColor.black.cgColor
        cellLikeButton.layer.shadowOpacity = 0.2
        cellLikeButton.layer.shadowOffset = .zero
        cellLikeButton.layer.shadowRadius = 10
        cellLikeButton.addTarget(self, action: #selector(likePost(sender:)), for: .touchUpInside)
        cellDetailBaseView.addSubview(cellLikeButton)
        
        cellLikeButton.translatesAutoresizingMaskIntoConstraints = false
        cellLikeButton.centerYAnchor.constraint(equalTo: cellDetailBaseView.bottomAnchor).isActive = true
        cellLikeButton.leftAnchor.constraint(equalTo: cellDetailBaseView.leftAnchor, constant: 12).isActive = true
        cellLikeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        cellLikeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
    }
    
    func changeButtonTitle(cellData: FeedModel) {
        if cellData.isLiked {
            cellLikeButton.setTitle("LIKED", for: .normal)
        } else {
            cellLikeButton.setTitle("LIKE", for: .normal)
        }
    }
    
    @objc func likePost(sender: UIButton) {
        print("likepost btn ")
        if self.cellLikeButton.titleLabel?.text == "LIKE" {
            cellDelegate.likePost(postId: cellInd)
        } else {
            cellDelegate.unlikePost(postId: cellInd)
        }
        
    }
    
}

protocol LikeButtonProtocol {
    func likePost(postId: Int)
    func unlikePost(postId: Int)
    func showLikedPosts()
    func showMyPosts()
}
