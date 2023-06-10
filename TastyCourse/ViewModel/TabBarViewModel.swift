//
//  TabBarViewModel.swift
//  TastyCourse
//
//  Created by Константин on 10.06.2023.
//

import Foundation
import FirebaseAuth

class TabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
