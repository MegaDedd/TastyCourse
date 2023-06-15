//
//  ProfileViewModel.swift
//  TastyCourse
//
//  Created by Константин on 12.06.2023.
//

import Foundation


class ProfileViewModel: ObservableObject {
    
    @Published var profile: MWUser
    
    init(profile: MWUser) {
        self.profile = profile
    }
    
    func setProfile() {
        
        DataBaseService.shared.setProfile(user: self.profile) { result in
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Ошбика отправки данных \(error.localizedDescription )")
            }
        }
    }
    
    func getProfile() {
        DataBaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
