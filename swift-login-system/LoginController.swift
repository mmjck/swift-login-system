//
//  LoginViewController.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 25/04/23.
//

import UIKit

class LoginController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Sign in", subTitle: "Sign in to your account")
    
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let passwordField = CustomTextField(fieldType: .password)
    
    
    private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    
    private let signUpButton = CustomButton(title: "New USer? Create Account", fontSize: .med)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password?", fontSize: .med)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        self.signInButton.addTarget(  self, action: #selector(didTapSignIn), for: .touchUpInside)
        
        self.signUpButton.addTarget(  self, action: #selector(didTapSignUp), for: .touchUpInside)
        
        self.forgotPasswordButton.addTarget(  self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        self.viewWillAppear(animated)
    //        self.navigationController?.navigationBar.isHidden = true
    //    }
    
    private func setupUI(){
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)

        
        
        self.view.addSubview(signInButton)
        self.view.addSubview(signUpButton)
        self.view.addSubview(forgotPasswordButton)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false

        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            self.passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
         
            
            self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
          
            
            self.signUpButton.topAnchor.constraint(equalTo: signInButton .bottomAnchor, constant: 11),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 44),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
          
            
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: signUpButton .bottomAnchor, constant: 11),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
        
        
        self.view.backgroundColor = .systemBackground
        
        
    }
}


extension LoginController {
    @objc private func didTapSignIn(){
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc private func didTapSignUp(){
        let vc = RegisterController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapForgotPassword (){
        let vc = ForgotPasswordController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true )
    }
}

