//
//  Product.swift
//  Ethereal Artefacts
//
//  Created by Albert Khurshudyan on 7.05.23.
//

import Foundation

struct Product: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var price: Float
    var description: String = "Indulge in a heavenly tea experience with our Stargazer’s Tea Set, featuring a constellation-themed teapot and matching teacups. Crafted from fine porcelain, this elegant set will transport you to the cosmos with every sip."
    var category: String
    var rating: Int
    var stock: Bool = true
}

var productList = [
    Product(name: "Solar Flare Pendant", image: "Solar Flare Pendant2", price: 55, category: "Jewellery", rating: 5),
    Product(name: "Stargazer’s Tea Set", image: "Stargazer’s Tea Set", price: 90, category: "Home", rating: 5),
    Product(name: "Intergalactic Planter", image: "Intergalactic Planter", price: 30, category: "Home", rating: 4),
    Product(name: "Astrological Guidebook", image: "Astrological Guidebook", price: 20, category: "Books", rating: 4),
]
