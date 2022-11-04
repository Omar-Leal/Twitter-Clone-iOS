//
//  OnboardingVC.swift
//  Twitter-Clone-Example
//
//  Created by Omar Leal on 11/3/22.
//

import UIKit

class OnboardingVC: UIViewController {
    
    
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "See what's happening in the world right now"
        label.font  = .systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    
    private let createAccountButtton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = twitterBackgroundButtonBlue
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 30
        
        return button
    }()
    
    private let promptLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Do you have an Account?"
        return label
    }()
    
    
    private let loginBotton: UIButton = {
        let button  = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.tintColor = twitterBackgroundButtonBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        [ welcomeLabel, createAccountButtton, promptLabel, loginBotton ].forEach(view.addSubview)
        configureConstraints()
    }
    

  
    private func configureConstraints() {
        let welcomeText =
        [
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        let createAccountButttonRules =
        [
            createAccountButtton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButtton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            createAccountButtton.widthAnchor.constraint(equalTo: welcomeLabel.widthAnchor, constant: -20),
            createAccountButtton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let promptLableRules =
        [
            promptLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            promptLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ]
        
        let loginButtonRules =  [
            loginBotton.centerYAnchor.constraint(equalTo: promptLabel.centerYAnchor),
            loginBotton.leadingAnchor.constraint(equalTo: promptLabel.trailingAnchor, constant: 10)
        ]
        
        
        
        [ welcomeText, createAccountButttonRules,  promptLableRules, loginButtonRules ].forEach(NSLayoutConstraint.activate)
    }

}


/**
 
 
 https://www.figma.com/file/O2ynkaN3NRIw76CabqYCRa/Twitter-IOS-Design-System-for-Figma-Community-(Community)?node-id=20%3A578
 */
