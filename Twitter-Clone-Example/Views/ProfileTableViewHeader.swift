//
//  ProfileHeader.swift
//  Twitter-Clone-Example
//
//  Created by Omar Leal on 11/1/22.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    
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
          joinDateLabel
        ].forEach(addSubview)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No View")
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
            userBioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
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
        
        NSLayoutConstraint.activate(backgroundImage)
        NSLayoutConstraint.activate(avatarProfile)
        NSLayoutConstraint.activate(displayNames)
        NSLayoutConstraint.activate(userName)
        NSLayoutConstraint.activate(userBioConstraints)
        NSLayoutConstraint.activate(calendarIcon)
        NSLayoutConstraint.activate(joinedText)
    }
}
