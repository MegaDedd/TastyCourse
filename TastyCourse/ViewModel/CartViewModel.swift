//
//  CartViewModel.swift
//  TastyCourse
//
//  Created by Константин on 02.06.2023.
//

import Foundation

class CartViewModel: ObservableObject {
   @Published var positions = [Position]()
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
