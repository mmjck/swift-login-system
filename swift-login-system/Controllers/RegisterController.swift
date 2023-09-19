//
//  RegisterController.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 25/04/23.
//

import UIKit

class RegisterController: UIViewController {
    
    
    private let headerView = AuthHeaderView(title: "Sign up", subTitle: "Create your account")
    
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    
    private let signUpButton = CustomButton(title: "Sign up",hasBackground: true, fontSize: .med)
    private let signInButton = CustomButton(title: "Already have an account? Sign In", fontSize: .med)
    
    private let termsTextView: UITextView = {
        
        
        
        let attributeString = NSMutableAttributedString(string: "By creating an accnount, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy")
        
        attributeString.addAttribute(.link, value: "terms://termsAndCondition", range: (attributeString.string as NSString).range(of: "Terms & Conditions"))
        
        
        attributeString.addAttribute(.link, value: "privacy://privacePolicy", range: (attributeString.string as NSString).range(of: "Privacy Policy"))
        
        let textView = UITextView()
        
        textView.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        textView.attributedText = attributeString
        textView.backgroundColor = .clear
        textView.textColor = .label
        textView.isSelectable = true
        textView.isEditable = false
        textView.delaysContentTouches = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.termsTextView.delegate = self
        self.signInButton.addTarget(  self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.signUpButton.addTarget(  self, action: #selector(didTapSignUp), for: .touchUpInside)
        
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        self.viewWillAppear(animated)
    //        self.navigationController?.navigationBar.isHidden = true
    //    }
    
    private func setupUI(){
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(emailField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(signInButton)
        
        
        
        
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.usernameField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        self.termsTextView.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            self.emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            self.signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            self.termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 22),
            self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
            self.signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 22),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
        
        
        self.view.backgroundColor = .systemBackground
        
        
    }
}


extension RegisterController {
    @objc private func didTapSignIn(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func didTapSignUp(){
        let userRequest = RegisterUserRequest(
            email: self.emailField.text ?? "", username: self.usernameField.text ?? "", password: self.passwordField.text ?? "")
        
//        
//        if !Validator.isValidUsername(for: userRequest.username) {
//            AlertManager.showInvalidUserNameAlert(on: self)
//            return
//        }
//        
//        if !Validator.isValidEmail(for: userRequest.email) {
//            AlertManager.showInvalidEmailAlert(on: self)
//            return
//        }
//        
//        if !Validator.isValidUsername(for: userRequest.username) {
//            AlertManager.showInvalidPasswordAlert(on: self)
//            return
//        }
        
        
        guard let request = Endpoint.createAccount(userRequest: userRequest).request else { return }
        
        
        AuthService.createAccount(request: request) {
            result in
            switch result {
            case .success(_):
                print("success")
            case .failure(_):
                print("error")
            }
        }
        
        //        let webViewer = WebViewController(with: "https://www.memeatlas.com/images/pepes/pepe-fancy-smoking-cigar-served-by-seething-wojak.jpg")
        //        let nav = UINavigationController(rootViewController: webViewer)
        //               self.present(nav, animated: true, completion: nil)
    }
}



extension RegisterController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "terms" {
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en")
        }else {
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en")
        }
        return true
    }
    
    
    private func showWebViewerController(with urlString: String) {
        let vc = WebViewController(with: urlString)
        
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
