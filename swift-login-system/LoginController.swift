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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }
    
    
    private func setupUI(){
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        
        self.view.backgroundColor = .systemBackground
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
                       self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                       self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                       self.headerView.heightAnchor.constraint(equalToConstant: 222),
                       
                       
        ])
        
        
        
        
        NSLayoutConstraint.activate([
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
                       self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                       self.usernameField.heightAnchor.constraint(equalToConstant: 55),
                       self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    


}
