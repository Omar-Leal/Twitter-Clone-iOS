//
//  TweetTableViewCell.swift
//  Twitter-Clone-Example
//
//  Created by Omar Leal on 10/8/22.
//

import UIKit


protocol TweetTableViewDelegate: AnyObject {
    func TweetTableViewDidTapReply()
    func TweetTableViewCellDidTabRetweet()
    func TweetTableViewCellDidTabLike()
    func TweetTableViewCellDidTabShared()
}


class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"
    private let margins: CGFloat = 44
    
    weak var delegateAction: TweetTableViewDelegate?
    
    
    
    //We load the member avatar from Backend in this component
    private let avatarImageView: UIImageView = {
        let avatarView = UIImageView()
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.contentMode = .scaleAspectFill
        avatarView.layer.cornerRadius = 25
        avatarView.layer.masksToBounds = true
        avatarView.clipsToBounds = true
        avatarView.image = UIImage(named: "Valentina")
        avatarView.backgroundColor = .brown
        return avatarView
    }()
    
    
    // user name
    private let displayName: UILabel = {
       let label = UILabel()
        label.text = "Valentina Isabel"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // user account
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.text = "@vit"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private let tweetTextContentLable: UILabel = {
       let tweetText = UILabel()
        tweetText.translatesAutoresizingMaskIntoConstraints = false
        tweetText.text = tweetExample
        tweetText.numberOfLines = 0
        return tweetText
    }()
    
    
    
    /**   Buttons tweets     **/  /**   Buttons tweets     **/
    /**   Buttons tweets     **/  /**   Buttons tweets     **/
    /**   Buttons tweets     **/  /**   Buttons tweets     **/
    
    
    private let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ReplyButton"), for: .normal)
        button.tintColor = .systemGray
        
        return button
    }()
    
    
    private let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "shareButton"), for: .normal)
        button.tintColor = .systemGray2
        
        return button
    }()
    
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "likeIcon"), for: .normal)
        button.tintColor = .systemGray2
        
        return button
    }()
    
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "bookMarkIcon"), for: .normal)
        button.tintColor = .systemGray2
        
        return button
    }()
    
    
    
    // init of the view
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [
         avatarImageView,
         displayName,
         usernameLabel,
         tweetTextContentLable,
         replyButton,
         retweetButton,
         replyButton,
         likeButton,
         shareButton
        ].forEach(contentView.addSubview)
        configuredConstraint()
        
    }
    
    
    @objc func didTapReply() {
        delegateAction?.TweetTableViewDidTapReply()
    }
    
    @objc func didTapRetweet() {
        delegateAction?.TweetTableViewCellDidTabRetweet()
    }
    
    @objc func didTapLike() {
        delegateAction?.TweetTableViewCellDidTabLike()
    }
    
    @objc func didTapShare() {
        delegateAction?.TweetTableViewCellDidTabShared()
    }
    
    
    private func configureButtons() {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configuredConstraint() {
        let avatarImageConstraintRules = [
         // Leading anchor that is going to be constrained by the leading anchor of cell
            // going to be pushed to the right direction
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let displayNameLabelConstraint =  [
            displayName.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            displayName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ]
        
        let userAccountConstraint = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayName.trailingAnchor, constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: displayName.centerYAnchor)
        ]
        
        
        let tweetTextConstraints = [
            tweetTextContentLable.leadingAnchor.constraint(equalTo: displayName.leadingAnchor),
            tweetTextContentLable.topAnchor.constraint(equalTo: displayName.bottomAnchor, constant: 10),
            tweetTextContentLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            //tweetTextContentLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
        ]
        
        let replyButtonConstraint = [
            replyButton.leadingAnchor.constraint(equalTo: tweetTextContentLable.leadingAnchor),
            replyButton.topAnchor.constraint(equalTo: tweetTextContentLable.bottomAnchor, constant: 10),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]
        
        
        let retweetButtonConstraints = [
            retweetButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: margins),
            retweetButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
        ]
        
        
        let likeButtonConstraints = [
            likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: margins),
            likeButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]
        
        let shareButtonConstraints = [
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: margins),
            shareButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(avatarImageConstraintRules)
        NSLayoutConstraint.activate(displayNameLabelConstraint)
        NSLayoutConstraint.activate(userAccountConstraint)
        NSLayoutConstraint.activate(tweetTextConstraints)
        NSLayoutConstraint.activate(replyButtonConstraint)
        NSLayoutConstraint.activate(retweetButtonConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
        
        
        
    }
    
    

}
