//
//  ProductDetailViewModel.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import Foundation




class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["маленькая", "средняя", "большая"]
    @Published var count = 0
    
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "маленькая": return product.price
        case "средняя": return Int(Double(product.price) * 1.25)
        case "большая": return Int(Double(product.price) * 1.5)
        default: return 0
            
        }
    }
    
    enum Sizes: String {
        case small
        case medium
        case big
    }
    
}
