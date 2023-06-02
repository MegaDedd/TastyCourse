//
//  Positions.swift
//  TastyCourse
//
//  Created by Константин on 02.06.2023.
//

import Foundation

struct Position {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
}
