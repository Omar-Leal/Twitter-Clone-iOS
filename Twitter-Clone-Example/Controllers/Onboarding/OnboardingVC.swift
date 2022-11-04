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
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        [ welcomeLabel ].forEach(view.addSubview)
        configureConstraints()
    }
    

  
    private func configureConstraints() {
        
    }

}
