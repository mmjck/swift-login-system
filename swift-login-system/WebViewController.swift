//
//  WebViewController.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 13/09/23.
//

import UIKit

import WebKit

class WebViewController: UIViewController {

    private let urlString: String
    private let webView =  WKWebView()
    
    
    
    
    init(with urlString: String){
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        guard let url = URL(string: self.urlString) else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        
        self.webView.load(URLRequest(url: url))
        self.setupUI()
        
    }
    
    private func setupUI(){
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target:  self, action: #selector(didTapDone))
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        self.view.addSubview(webView)
        self.webView.translatesAutoresizingMaskIntoConstraints  = false
        
        
        
        NSLayoutConstraint.activate([
            self.webView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
        ])
    }
}

extension WebViewController {
    @objc private func didTapDone(){
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
}
