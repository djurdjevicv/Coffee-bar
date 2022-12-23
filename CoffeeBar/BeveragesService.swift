//
//  BeveragesService.swift
//  CoffeeBar
//
//  Created by Vladimir Djurdjevic on 14.12.22..
//

import Foundation

class BeverageService {
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> AllBeverages? {
        do {
            let decodedData = try JSONDecoder().decode(AllBeverages.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func loadImage(imageUrl: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: imageUrl){
            getData(from: url) { data, response, error in
                if let err = error {
                    print("Error getting beverage image: \(err)")
                    completion(.failure(err))
                } else if let dataImage = data {
                    completion(.success(dataImage))
                }
            }
        }
    }
    
}
