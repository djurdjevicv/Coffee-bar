//
//  BeverageCollectionViewCell.swift
//  CoffeeBar
//
//  Created by Vladimir Djurdjevic on 14.12.22..
//

import UIKit

class BeverageCollectionViewCell: UICollectionViewCell {
    
    lazy var beveragePicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var beverageName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indictor = UIActivityIndicatorView()
        indictor.translatesAutoresizingMaskIntoConstraints = false
        indictor.color = .white
        return indictor
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        styleView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(activityIndicator)
        addSubview(beveragePicture)
        addSubview(beverageName)
        
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        beveragePicture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        beveragePicture.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        beveragePicture.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5).isActive = true
        beveragePicture.widthAnchor.constraint(equalToConstant: 50).isActive = true
        beveragePicture.heightAnchor.constraint(equalToConstant: 150).isActive = true
                
        beverageName.centerXAnchor.constraint(equalTo: beveragePicture.centerXAnchor).isActive = true
        beverageName.topAnchor.constraint(equalTo: beveragePicture.bottomAnchor, constant: 5).isActive = true
    }
    
    private func styleView() {
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        beverageName.textColor = .white
    }
    
}
