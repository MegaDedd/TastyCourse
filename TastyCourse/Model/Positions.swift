//
//  Positions.swift
//  TastyCourse
//
//  Created by Константин on 02.06.2023.
//

import Foundation
// позиция которая отправляется в базу данных
struct Position: Identifiable {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
    var representation: [String : Any] {
        
        var repres = [String : Any]()
        
        repres["id"] = id
        repres["count"] = count
        repres["title"] = product.title
        repres["price"] = product.price
        repres["cost"] = self.cost

        return repres
    }
}
