//
//  OrderStatus.swift
//  TastyCourse
//
//  Created by Константин on 15.06.2023.
//

import Foundation

enum OrderStatus: String {
    
    case new = "Новый"
    case cooking = "Готовится"
    case delivery = "Доставляется"
    case complete = "Выполнен"
    case canseled = "Отменен"
}
