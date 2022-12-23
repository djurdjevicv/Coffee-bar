//
//  BeverageCollectionView.swift
//  CoffeeBar
//
//  Created by Vladimir Djurdjevic on 14.12.22..
//

import UIKit

class BeverageCollectionView: UIView {

    lazy var beverageCollectionView:  UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 20, right: 30)
        let screenSize = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenSize/2-50 , height: 190 )
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(BeverageCollectionViewCell.self, forCellWithReuseIdentifier: Constants.beveragesCollectionViewCell)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        styleView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(beverageCollectionView)
        
        beverageCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        beverageCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        beverageCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        beverageCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func styleView() {
        beverageCollectionView.backgroundColor = .clear
    }

}
