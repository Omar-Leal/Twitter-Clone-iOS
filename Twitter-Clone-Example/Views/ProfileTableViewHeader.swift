//
//  ProfileHeader.swift
//  Twitter-Clone-Example
//
//  Created by Omar Leal on 11/1/22.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    
    // index of the selected tap
    private enum TapByIndex: String {
        case tweets = "Tweets"
        case tweetsAndReplies = "Tweets & replies"
        case media = "Media"
        case likes = "Likes"
        
        
        var selectedIndex: Int {
            switch self {
            case .tweets:
                return 0
            case .tweetsAndReplies:
                return 1
            case .media:
                return 2
            case .likes:
                return 3
            
            }
        }
        
    }
    
    private var selectedTabAtIndex: Int  = 0 {
        didSet {
            print("clousure \(selectedTabAtIndex)")
        }
    }
    
    private var tabs: [UIButton] = ["Tweets", "Tweets & replies", " Media", "Likes"]
        .map { buttonTitle in
            let buttons = UIButton(type: .system)
            buttons.setTitle(buttonTitle, for: .normal)
            buttons.translatesAutoresizingMaskIntoConstraints = false
            buttons.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            buttons.tintColor = .label
            return buttons
        }
    
    private lazy var stackSession: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    
    private let followersTextLabel: UILabel = {
       let followersText = UILabel()
        followersText.translatesAutoresizingMaskIntoConstraints = false
        followersText.font = .systemFont(ofSize: 14, weight: .regular)
        followersText.text = "Followers"
        followersText.textColor = .secondaryLabel
        return followersText
    }()
    
    
    private let followersCountLabel: UILabel = {
       let followersCount = UILabel()
        followersCount.translatesAutoresizingMaskIntoConstraints = false
        followersCount.font = .systemFont(ofSize: 14, weight: .regular)
        followersCount.text = "1M"
        followersCount.textColor = .secondaryLabel
        return followersCount
    }()
    
    
    private let followingTextLabel: UILabel = {
       let followingText = UILabel()
        followingText.translatesAutoresizingMaskIntoConstraints = false
        followingText.font = .systemFont(ofSize: 14, weight: .regular)
        followingText.text = "Following"
        followingText.textColor = .secondaryLabel
        return followingText
    }()
    
    
    private let followingCountLabel: UILabel = {
       let followingCount = UILabel()
        followingCount.translatesAutoresizingMaskIntoConstraints = false
        followingCount.text = "314"
        followingCount.textColor = .label
        followingCount.font = .systemFont(ofSize: 14, weight: .bold)
        
        return followingCount
    }()
    
    private let joinDateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Joined in April 2019"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let calendarJoined: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        image.tintColor = .secondaryLabel
        return image
    }()
    
    private let userBioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textColor = .label
        label.text = "Frontend Dev | iOS Developer"
        return label
    }()
    
    
    private let userNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@Tina25"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    private let displayNameLabel: UILabel = {
        let displyName = UILabel()
        displyName.text = "Valentina Isabel"
        displyName.font = .systemFont(ofSize: 20, weight: .bold)
        displyName.translatesAutoresizingMaskIntoConstraints = false
        return displyName
    }()
    
    
    
    
    private let avatarImageView: UIImageView = {
        let profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.clipsToBounds = true
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 40
        profileImage.backgroundColor = .white
        profileImage.image = UIImage(named: "Valentina")
        return profileImage
    }()
    
    
    private let profileBackground: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "canada")
        imageView.clipsToBounds = true // with this, image is not going to overflow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        [ profileBackground,
          avatarImageView,
          displayNameLabel,
          userNameLabel,
          userBioLabel,
          calendarJoined,
          joinDateLabel,
          followingCountLabel,
          //followingTextLabel,
//          followersCountLabel,
//          followersTextLabel
          stackSession
        ].forEach(addSubview)
        setConstraints()
        configureStackButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No View")
    }
    
    private func configureStackButton() {
        for (_, button) in stackSession.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else { return }
            button.addTarget(self, action: #selector(didTapTabListener(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapTabListener(_ sender: UIButton) {
        guard let label =  sender.titleLabel?.text else {  return }
        switch label {
        case TapByIndex.tweets.rawValue:
            selectedTabAtIndex = 0
        case TapByIndex.tweetsAndReplies.rawValue:
            selectedTabAtIndex = 1
        case TapByIndex.media.rawValue:
            selectedTabAtIndex = 2
        case TapByIndex.likes.rawValue:
            selectedTabAtIndex = 3
        default:
            selectedTabAtIndex = 0
        }
    }
    
    private func setConstraints(){
        let backgroundImage = [
            profileBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackground.topAnchor.constraint(equalTo: topAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackground.heightAnchor.constraint(equalToConstant: 180)
        ]
        
        let avatarProfile = [
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarImageView.centerYAnchor.constraint(equalTo: profileBackground.bottomAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 76),
            avatarImageView.heightAnchor.constraint(equalToConstant: 76)
        ]
        
        let displayNames = [
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            displayNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20)
        ]
        
        let userName = [
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            userNameLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 2)
        ]
        
        
        let userBioConstraints = [
            userBioLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
           // userBioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            userBioLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            
        ]
        
        let calendarIcon = [
            calendarJoined.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            calendarJoined.topAnchor.constraint(equalTo: userBioLabel.bottomAnchor, constant: 5)
        ]
        
        let joinedText = [
            joinDateLabel.leadingAnchor.constraint(equalTo: calendarJoined.trailingAnchor, constant: 2),
            joinDateLabel.bottomAnchor.constraint(equalTo: calendarJoined.bottomAnchor)
        ]
        
        
        let followingCount =  [
            followingCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            followingCountLabel.topAnchor.constraint(equalTo: joinDateLabel.bottomAnchor, constant: 10),
        ]
        
//        let followingText = [
//            followingTextLabel.leadingAnchor.constraint(equalTo: followersCountLabel.trailingAnchor, constant: 4),
//            followingTextLabel.topAnchor.constraint(equalTo: joinDateLabel.bottomAnchor, constant: 10)
//        ]
        
//        let followersCount = [
//            followersCountLabel.leadingAnchor.constraint(equalTo:  followingTextLabel.trailingAnchor, constant: 4),
//            followersCountLabel.topAnchor.constraint(equalTo: joinDateLabel.bottomAnchor)
//         
//        ]
//        
//        let followersText = [
//            followersTextLabel.leadingAnchor.constraint(equalTo: followersCountLabel.trailingAnchor, constant: 4),
//            followersTextLabel.bottomAnchor.constraint(equalTo: followersCountLabel.bottomAnchor)
//        ]

        
         let sessionStackConstraint = [
            stackSession.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            stackSession.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            stackSession.topAnchor.constraint(equalTo: followingCountLabel.bottomAnchor, constant: 5),
            
            stackSession.heightAnchor.constraint(equalToConstant: 35)
         ]
        
        [backgroundImage,
         avatarProfile ,
         displayNames,
         userName,
         userBioConstraints,
         calendarIcon,
         joinedText,
         followingCount,
         sessionStackConstraint
        ].forEach(NSLayoutConstraint.activate)
        
       // NSLayoutConstraint.activate(followingText)
//        NSLayoutConstraint.activate(followersCount)
//        NSLayoutConstraint.activate(followersText)
    }
}
