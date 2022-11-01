//
//  ProfileHeader.swift
//  Twitter-Clone-Example
//
//  Created by Omar Leal on 11/1/22.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    private let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "canada")
        imageView.clipsToBounds = true // with this, image is not going to overflow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
       backgroundColor = .brown
        addSubview(profileImageView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No View")
    }
    
    
    private func setConstraints(){
        let backgroundImage = [
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 180)
        ]
        
        NSLayoutConstraint.activate(backgroundImage)
        
    }
}
