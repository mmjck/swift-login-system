//
//  ForgotPasswordViewController.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 25/04/23.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Reset your password")
    private let email = CustomTextField(fieldType: .email)
    private let button = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        
        self.setupUI()
    }
    
    
    private func setupUI(){
        self.view.addSubview(headerView)
        self.view.addSubview(email)
        self.view.addSubview(button)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        email.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
        ])
        
        NSLayoutConstraint.activate([
            self.email.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.email.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.email.heightAnchor.constraint(equalToConstant: 55),
            self.email.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
        
        
        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 22),
            self.button.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.button.heightAnchor.constraint(equalToConstant: 55),
            self.button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
        
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        self.viewWillAppear(animated)
    //        self.navigationController?.navigationBar.isHidden = false
    //    }
}

extension ForgotPasswordController {
    @objc private func didTapForgotPassword() {
        guard let currentEmail = self.email.text, !currentEmail.isEmpty else { return }
        // TODO: - Email validation
    }
}
