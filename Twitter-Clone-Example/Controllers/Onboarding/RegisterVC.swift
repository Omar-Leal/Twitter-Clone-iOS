//
//  RegisterVC.swift
//  Twitter-Clone-Example
//
//  Created by Omar Leal on 11/4/22.
//

import UIKit

class RegisterVC: UIViewController {
    
    private let registerTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create your account here"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        
        return label
    }()
    
    
    private let emailField: UITextField = {
       let emailField = UITextField()
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.attributedPlaceholder = NSAttributedString(
            string: "Place a email",
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return emailField
    }()
    
    
    
    
    
    private let passwordFiled: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.attributedPlaceholder = NSAttributedString(
            string: "Set a strong password",
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return password
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // adding components to view
        [ registerTitleLabel, emailField, passwordFiled ].forEach(view.addSubview)
        
        
    }
    

    
    private func constraintsRules() {
        
        let registerTitleLabelConstraints =  [ ]
        
        let emailFieldConstrainst =  []
        
        let password = [  ]
        
    }
    

}
