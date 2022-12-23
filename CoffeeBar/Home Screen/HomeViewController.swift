//
//  HomeViewController.swift
//  CoffeeBar
//
//  Created by Vladimir Djurdjevic on 14.12.22..
//

import UIKit

class HomeViewController: UIViewController {

    private let homeView = HomeView()
    private let beverageService = BeverageService()
    
    var listOfBeverages: [Beverage] = []
    var filter: BaverageType = .all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = homeView
        
        homeView.backgroundColor = UIColor(named: "Background")
        
        self.homeView.beverageCollectionView.beverageCollectionView.delegate = self
        self.homeView.beverageCollectionView.beverageCollectionView.dataSource = self
        
        getAllBeverages(filter: filter)
        setPopupButton()
    }
    
    func getAllBeverages(filter: BaverageType) {
        let jsonData = beverageService.readLocalJSONFile(forName: "Beverages")
        if let data = jsonData {
            if let beverages = beverageService.parse(jsonData: data) {
                listOfBeverages = beverages.allBeverages
                switch filter {
                case .all:
                    return listOfBeverages = beverages.allBeverages
                case .tea:
                    var newList: [Beverage] = []
                    for beverage in listOfBeverages {
                        if beverage.type == BaverageType.tea.rawValue {
                            newList.append(beverage)
                        }
                    }
                    return listOfBeverages = newList
                case .coffee:
                    var newList: [Beverage] = []
                    for beverage in listOfBeverages {
                        if beverage.type == BaverageType.coffee.rawValue {
                            newList.append(beverage)
                        }
                    }
                    return listOfBeverages = newList
                case .hot_beverages:
                    var newList: [Beverage] = []
                    for beverage in listOfBeverages {
                        if beverage.type == BaverageType.hot_beverages.rawValue {
                            newList.append(beverage)
                        }
                    }
                    return listOfBeverages = newList
                case .coffe_with_milk:
                    var newList: [Beverage] = []
                    for beverage in listOfBeverages {
                        if let milk = beverage.withMilk {
                            if milk {
                                newList.append(beverage)
                            }
                        }
                    }
                    return listOfBeverages = newList
                case .coffe_without_milk:
                    var newList: [Beverage] = []
                    for beverage in listOfBeverages {
                        if let milk = beverage.withMilk {
                            if !milk {
                                newList.append(beverage)
                            }
                        }
                    }
                    return listOfBeverages = newList
                }
                
            }
        }
    }
    
    override func reloadInputViews() {
        super.reloadInputViews()
        self.getAllBeverages(filter: self.filter)
        self.homeView.beverageCollectionView.beverageCollectionView.reloadData()
    }
    
    func setPopupButton(){
        let optionClosure = {(action: UIAction) in
            if action.title == "All beverage" {
                self.filter = .all
            } else if action.title == "Coffee" {
                self.filter = .coffee
            } else if action.title == "Tea" {
                self.filter = .tea
            }  else if action.title == "Hot beverages" {
                self.filter = .hot_beverages
            } else if action.title == "Coffe with milk" {
                self.filter = .coffe_with_milk
            } else if action.title == "Coffe without milk" {
                self.filter = .coffe_without_milk
            }
            self.reloadInputViews()
        }
        
        homeView.popupButton.menu = UIMenu(children  : [
            UIAction(title : "All beverage", state: .on, handler: optionClosure),
            UIAction(title : "Coffee", handler: optionClosure),
            UIAction(title : "Tea", handler: optionClosure),
            UIAction(title : "Hot beverages", handler: optionClosure),
            UIAction(title : "Coffe with milk", handler: optionClosure),
            UIAction(title : "Coffe without milk", handler: optionClosure)
        ])
        
        homeView.popupButton.showsMenuAsPrimaryAction = true
        homeView.popupButton.changesSelectionAsPrimaryAction = true
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfBeverages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.beveragesCollectionViewCell, for: indexPath) as? BeverageCollectionViewCell {

            let beverage = listOfBeverages[indexPath.row]
            
            cell.activityIndicator.startAnimating()
            cell.beveragePicture.isHidden = true
            cell.beverageName.isHidden = true
            
            beverageService.loadImage(imageUrl: beverage.imageUrl) { result in
                switch result {
                case .success(let imageData):
                    
                    DispatchQueue.main.async {
                        cell.beveragePicture.image = UIImage(data: imageData)
                        cell.beverageName.text = beverage.name
                        cell.beveragePicture.isHidden = false
                        cell.beverageName.isHidden = false
                        cell.activityIndicator.stopAnimating()
                    }
                case .failure(let error):
                    print(error)
                }
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let beverage = listOfBeverages[indexPath.row]
        
        let detailsViewController = DetailsViewController()
        detailsViewController.beverageItem = beverage
        
        self.present(detailsViewController, animated: true, completion: nil);
        
    }

}
