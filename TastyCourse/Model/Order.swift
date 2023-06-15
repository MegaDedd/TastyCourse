//
//  Order.swift
//  TastyCourse
//
//  Created by Константин on 15.06.2023.
//

import Foundation
import FirebaseFirestore //

struct Order {
    var id: String = UUID().uuidString
    var userID: String
    var positions = [Position]()
    var date: Date
    var status: String
    
    var cost: Int {
        var sum = 0
        for pos in positions {
            sum += pos.cost
        }
        return sum
    }
    var representation: [String : Any] {
        var repres = [String : Any]()
        
        repres["id"] = id
        repres["userID"] = userID
        repres["date"] = Timestamp(date: date)
        repres["status"] = status
        return repres
    }
}
