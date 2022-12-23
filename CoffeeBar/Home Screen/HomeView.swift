//
//  HomeView.swift
//  CoffeeBar
//
//  Created by Vladimir Djurdjevic on 14.12.22..
//

import UIKit

class HomeView: UIView {

    lazy var popupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.text = "COFFEE BAR"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var beverageCollectionView: BeverageCollectionView = {
        let view = BeverageCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(beverageCollectionView)
        addSubview(popupButton)
        
        mainTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        
        popupButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        popupButton.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10).isActive = true
        popupButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        popupButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        beverageCollectionView.topAnchor.constraint(equalTo: popupButton.bottomAnchor, constant: 10).isActive = true
        beverageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        beverageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        beverageCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func styleView(){
        mainTitle.textColor = .white
        beverageCollectionView.backgroundColor = .clear
        
        popupButton.backgroundColor = .white
        popupButton.setTitleColor(UIColor(named: "Background"), for: .normal)
        popupButton.layer.cornerRadius = 5
        popupButton.layer.borderWidth = 2
        popupButton.layer.borderColor = UIColor.black.cgColor
    }

}
