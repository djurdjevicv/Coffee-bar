//
//  Coffee.swift
//  CoffeeBar
//
//  Created by Vladimir Djurdjevic on 14.12.22..
//

import Foundation

struct Beverage: Codable  {
    let name: String
    let imageUrl: String
    let sizeAndPrice: [BeverageSizeAndPrice]
    let type: String
    let withMilk: Bool?
}
