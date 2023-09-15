//
//  HomeController.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 25/04/23.
//

import UIKit

class HomeController: UIViewController {
    
    private lazy var label: UILabel = {
        let _label = UILabel()
        _label.textColor = .label
        _label.textAlignment = .center
        _label.font = .systemFont(ofSize: 24, weight: .semibold)
        _label.text = "Loading..."
        _label.numberOfLines = 2
        
        return _label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setupUI()
    }
    private func setupUI(){
        self.view.backgroundColor = .systemPurple
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
        ])
    }
    
    
}


extension HomeController {
    @objc private func didTapLogout() {
        
    }
}
