//
//  DetailsView.swift
//  CoffeeBar
//
//  Created by Vladimir Djurdjevic on 14.12.22..
//

import UIKit

class DetailsView: UIView {

    lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var beverageImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indictor = UIActivityIndicatorView()
        indictor.translatesAutoresizingMaskIntoConstraints = false
        indictor.color = .white
        return indictor
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var popupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        styleView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupView() {
        addSubview(mainTitle)
        addSubview(beverageImage)
        addSubview(activityIndicator)
        addSubview(priceLabel)
        addSubview(popupButton)
        
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        mainTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        
        beverageImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        beverageImage.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10).isActive = true
        beverageImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        beverageImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        popupButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        popupButton.topAnchor.constraint(equalTo: beverageImage.bottomAnchor, constant: 50).isActive = true
        popupButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        popupButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: popupButton.bottomAnchor, constant: 50).isActive = true
    }
    
    func styleView(){
        mainTitle.textColor = .white
        priceLabel.textColor = .white
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        popupButton.backgroundColor = .white
        popupButton.setTitleColor(UIColor(named: "Background"), for: .normal)
        popupButton.layer.cornerRadius = 5
        popupButton.layer.borderWidth = 2
        popupButton.layer.borderColor = UIColor.black.cgColor
    }

}
