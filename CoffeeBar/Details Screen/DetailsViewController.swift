//
//  DetailsViewController.swift
//  CoffeeBar
//
//  Created by Vladimir Djurdjevic on 14.12.22..
//

import UIKit

class DetailsViewController: UIViewController {

    private let detailsView = DetailsView()
    private let beverageService = BeverageService()
    
    public var beverageItem = Beverage(name: "", imageUrl: "", sizeAndPrice: [BeverageSizeAndPrice(size: "", price: 0)], type: "", withMilk: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = detailsView
        
        detailsView.backgroundColor = UIColor(named: "Background")
        
        loadData()
        setPopupButton()
    }
    
    func loadData(){
        detailsView.activityIndicator.startAnimating()
        beverageService.loadImage(imageUrl: beverageItem.imageUrl) { result in
            switch result {
            case .success(let imageData):
                
                DispatchQueue.main.async {
                    self.detailsView.beverageImage.image = UIImage(data: imageData)
                    self.detailsView.mainTitle.text = self.beverageItem.name
                    self.detailsView.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setPopupButton(){
        let optionClosure = {(action: UIAction) in
            for test in self.beverageItem.sizeAndPrice {
                if action.title == test.size {
                    self.detailsView.priceLabel.isHidden = false
                    self.detailsView.priceLabel.text = "Price: \(test.price)$"
                } else if action.title == "Select beverage size" {
                    self.detailsView.priceLabel.isHidden = true
                }
            }
        }
        
        var menu = UIMenu()
        
        if beverageItem.sizeAndPrice.count == 2 {
            menu = UIMenu(children  : [
                UIAction(title : "Select beverage size", state: .on, handler: optionClosure),
                UIAction(title : beverageItem.sizeAndPrice[0].size, handler: optionClosure),
                UIAction(title : beverageItem.sizeAndPrice[1].size, handler: optionClosure)
            ])
        } else {
            menu = UIMenu(children  : [
                UIAction(title : "Select beverage size", state: .on, handler: optionClosure),
                UIAction(title : beverageItem.sizeAndPrice[0].size, handler: optionClosure),
                UIAction(title : beverageItem.sizeAndPrice[1].size, handler: optionClosure),
                UIAction(title : beverageItem.sizeAndPrice[2].size, handler: optionClosure)
            ])
        }

        detailsView.popupButton.menu = menu
        
        detailsView.popupButton.showsMenuAsPrimaryAction = true
        detailsView.popupButton.changesSelectionAsPrimaryAction = true
    }
    

}
