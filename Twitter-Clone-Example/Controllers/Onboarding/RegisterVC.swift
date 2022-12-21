//
//  RegisterVC.swift
//  Twitter-Clone-Example
//
//  Created by Omar Leal on 11/4/22.
//

import UIKit
import Combine

class RegisterVC: UIViewController {
    
    private let registerViewModel = RegisterViewModel()
	
	// Storing the subscription to the .store because we need to store our state somewhere
	private var subscriptions: Set<AnyCancellable> = []
	
	/// binding actions and logic from ViewModel
    private func bindViews() {
        emailField.addTarget(self, action: #selector(didChangeEmailField), for: .editingChanged)
        passwordFiled.addTarget(self, action: #selector(didChangePassword), for: .editingChanged)
        
        // COMBINE ASSIGNING INPUTS FIELD TO THE PUBLISHERS
		// the following pipeline is where we receive the value in order to get the create button enable
        registerViewModel.$isRegistrationFormValid.sink { [ weak self ] validationState in
            self?.saveAccountButton.isEnabled =  validationState
        }
        // Store our subscriptions
        .store(in: &subscriptions)
		
		registerViewModel.$user.sink { [ weak self ] user in
			print("THE USER \(user)")
		}
		.store(in: &subscriptions)
		
        
    }
    
    // EMAIL FIELD LISTENER
    @objc private func didChangeEmailField() {
        registerViewModel.email = emailField.text
        // THE form s valid ?
        registerViewModel.validateRegistrationForm() // check if the form is valid
    }
    
    
    // PASSWORD FIELD LISTENER
    @objc private func didChangePassword() {
        registerViewModel.password = passwordFiled.text
        // THE form s valid ?
        registerViewModel.validateRegistrationForm()
    }
    
    // Dismissing the key function to the UITapGestureRecognizer
    @objc private func didTapToDismiss() {
        view.endEditing(true)
    }
    
   
    
    private func configureNavigationBar() {
        let SIZE:Int = 26
        let twitterLogoView = UIImageView(frame: CGRect(x: 0, y: 0, width: SIZE, height: SIZE))
		twitterLogoView.contentMode = .scaleToFill
        twitterLogoView.image = UIImage(named: "twitterLogo")
        
        let middelView = UIView(frame: CGRect(x: 0, y: 0, width: SIZE, height: SIZE))
        middelView.addSubview(twitterLogoView)
        navigationItem.titleView =  middelView
      
        
      
    }
    
    private let containerView: UIView = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let registerTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create your account"
        label.font  = .systemFont(ofSize: 28, weight: .medium)
        label.textAlignment = .left
        label.textColor = .label
        return label
    }()
    
    
    private let emailField: UITextField = {
       let emailField = UITextField()
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.keyboardType = .emailAddress
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
    
    
    private let saveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = darkButtonColor
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        // adding components to view
        [registerTitleLabel,
         emailField,
         passwordFiled,
         saveAccountButton
        ].forEach(view.addSubview)
		saveAccountButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        constraintsRules()
        
        // To dismiss the keyboard if the user taps outside the fields
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        
        // Just binding the RegisterViewModel
        bindViews()
    }
    
	
	@objc func didTapRegister() {
		registerViewModel.createUser()
	}

    
    private func constraintsRules() {
        
//        let container  = [
//            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ]
        
        let registerTitleLabelConstraints =  [
            registerTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            registerTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ]
//
        let emailFieldConstrainst =  [
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailField.topAnchor.constraint(equalTo: registerTitleLabel.bottomAnchor, constant: 20),
            emailField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 60)
        ]

        let passwordsRules = [
            passwordFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordFiled.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordFiled.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            passwordFiled.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordFiled.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let saveAccountConstraints =  [
            saveAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveAccountButton.topAnchor.constraint(equalTo: passwordFiled.bottomAnchor, constant: 20),
            saveAccountButton.widthAnchor.constraint(equalToConstant: 300),
            saveAccountButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        
        //NSLayoutConstraint.activate(container)
        NSLayoutConstraint.activate(registerTitleLabelConstraints)
         NSLayoutConstraint.activate(emailFieldConstrainst)
        NSLayoutConstraint.activate(passwordsRules)
        NSLayoutConstraint.activate(saveAccountConstraints)
//
    }
    

    
    
    
    
    
}
