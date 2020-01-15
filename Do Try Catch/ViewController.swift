//
//  ViewController.swift
//  Do Try Catch
//
//  Created by Luis Segoviano on 14/01/20.
//  Copyright © 2020 The Segoviano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum LoginError: Error {
        case incompleteForm
        case invalidEmail
        case incorrectPasswordLength
    }

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "username@example.com"
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "• • • • • •"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Let's go!", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        setUpLayout()
    }
    
    private let leadingMargin: CGFloat   = 25.0  // Or Left Margin
    private let trailingMargin: CGFloat  = -25.0 // Or Right Margin
    private let heightTextField: CGFloat = 35.0
    
    func setUpLayout() {
        // Email input constraints
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: leadingMargin).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: trailingMargin).isActive = true
        
        // Password input constraints
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,
                                               constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: leadingMargin).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                    constant: trailingMargin).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        // Logon button constraints
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                         constant: 20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                             constant: leadingMargin).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                              constant: trailingMargin).isActive = true
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        do {
            try login()
            // Next screen
            Alert.showBasic(title: "Success!", message: "", vc: self)
        } catch LoginError.incompleteForm {
            Alert.showBasic(title: "Incomplete Form",
                            message: "Please fill out both email and password fields", vc: self)
        } catch LoginError.invalidEmail {
            Alert.showBasic(title: "Invalid Email Format",
                            message: "Please make sure you format your email correctly", vc: self)
        } catch LoginError.incorrectPasswordLength {
            Alert.showBasic(title: "Password Too Short",
                            message: "Password should be at least 6 characters", vc: self)
        } catch {
            Alert.showBasic(title: "Unable To Login",
                            message: "There was an error when attempting to login", vc: self)
        }
    }
    
    func login() throws {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        if password.count < 6 {
            throw LoginError.incorrectPasswordLength
        }
    }

}
