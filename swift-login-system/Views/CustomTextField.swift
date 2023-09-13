//
//  CustomTextField.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 12/09/23.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType {
        case email
        case password
        case username
        
    }
    
    
    private  let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))

        
        switch fieldType {
        case .username:
            self.placeholder = "Name"
            
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            
        case .email:
            self.placeholder = "E-mail"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
