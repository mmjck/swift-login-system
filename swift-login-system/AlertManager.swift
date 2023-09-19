//
//  AlertManager.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 18/09/23.
//

import Foundation
import UIKit


class AlertManager {
    private static func showBasicAlert(on vc:UIViewController, with title: String, and message: String?){
        
        DispatchQueue.main.async {
        
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss" , style: .default, handler: nil))
            
            
            vc.present(alert, animated: true)
        
        
            
        }
    }
}


extension AlertManager {
    public static func showInvalidEmailAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, with: "Invalid Email", and: "Please enter a valid email")
        
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, with: "Invalid Password", and: "Please enter a valid Password")
        
    }
    
    public static func showInvalidUserNameAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, with: "Invalid user name", and: "Please enter a valid user name")
        
    }
    
}


extension AlertManager {
    public static func showRegistrationErrorAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, with: "Unknopw sigin error", and: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Unknopw sigin error", and: "\(error.localizedDescription)")
    }
}



extension AlertManager {
    public static func showLoginErrorAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, with: "Unknopw registration error", and: nil)
    }
    
    public static func showLoginErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Unknopw registration error", and: "\(error.localizedDescription)")
    }
}

extension AlertManager {
    public static func showLogoutErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Unknopw logout error", and: "\(error.localizedDescription)")
    }
}



extension AlertManager {
    public static func showPasswordResetSent(on vc: UIViewController){
        self.showBasicAlert(on: vc, with: "password reset send", and: nil)
    }
    
    
    public static func showSendingPasswordErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Unknopw sending password error", and: "\(error.localizedDescription)")
    }
}



extension AlertManager {
    public static func showFetchingUserError(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Error fetching user", and: "\(error.localizedDescription)")
    }
    
    public static func showUnknowFetchingUserError(on vc: UIViewController){
        self.showBasicAlert(on: vc, with: "Unknow error fetching user", and: nil)
    }
}
