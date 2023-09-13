//
//  AuthHeaderView.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 12/09/23.
//

import Foundation
import UIKit

class AuthHeaderView: UIView {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logo")
        image.tintColor = .white
        
        return image
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        
        label.text = "Error"
        
        return label
    }()
 
    
    private let subTitleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        
        label.text = "Error"
        
        return label
    }()
    
    
    
    init(title: String, subTitle: String){
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI(){
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)


        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
       
        
        NSLayoutConstraint.activate([
                   self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
                   self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                   self.imageView.widthAnchor.constraint(equalToConstant: 90),
                   self.imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
                   
                   self.titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 19),
                   self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                   self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                   
                   self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
                   self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                   self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
               ])
    }
     
}
