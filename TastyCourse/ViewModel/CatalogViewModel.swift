//
//  CatalogViewModel.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import Foundation


class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel() // singltone
    
    var popularProducts = [
        Product(id: "1",
                title: "Margarita Gurme",
                imageURL: "Not Found",
                price: 450,
                description: "Margarita"),
        Product(id: "2",
                title: "Pepperonni",
                imageURL: "Not Found",
                price: 350,
                description: "самая простая пицца"),
        Product(id: "3",
                title: "Margarita",
                imageURL: "Not Found",
                price: 375,
                description: "самая простая пицца"),
        Product(id: "4",
                title: "Gavayskaya",
                imageURL: "Not Found",
                price: 575,
                description: "самая простая пицца"),
        Product(id: "5",
                title: "Pazza Paradaise",
                imageURL: "Not Found",
                price: 650,
                description: "самая простая пицца")
    ]
    
    var pizza = [
        Product(id: "1",
                title: "Margarita Gurme",
                imageURL: "Not Found",
                price: 450,
                description: "Margarita"),
        Product(id: "2",
                title: "Pepperonni",
                imageURL: "Not Found",
                price: 350,
                description: "самая простая пицца"),
        Product(id: "3",
                title: "Margarita",
                imageURL: "Not Found",
                price: 375,
                description: "самая простая пицца"),
        Product(id: "4",
                title: "Gavayskaya",
                imageURL: "Not Found",
                price: 575,
                description: "самая простая пицца"),
        Product(id: "5",
                title: "Pazza Paradaise",
                imageURL: "Not Found",
                price: 650,
                description: "самая простая пицца")
    ]
    
}
