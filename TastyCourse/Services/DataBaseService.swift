//
//  DataBaseService.swift
//  TastyCourse
//
//  Created by Константин on 12.06.2023.
//

import Foundation
import FirebaseFirestore

class DataBaseService {
    
    static let shared = DataBaseService()
    
    private let db = Firestore.firestore() // ссылаемся на папку pizzashop - 95125
    
    private var usersRef: CollectionReference { // ссылка на коллекцию пользователей, т.е. это и есть коллекция
       return db.collection("users")
    }
    
    private init() { }
    
    func setProfile(user: MWUser, completion: @escaping (Result<MWUser, Error>) -> (Void)) {
        
            // записываем юзера в коллекцию
            usersRef.document(user.id).setData(user.representation) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(user))
                }
            }
    }
    
    func getProfile(completion: @escaping (Result<MWUser, Error>) -> Void)  {
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in // docSnapshot это свойства в firebase
            
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let address = data["address"] as? String else { return }
            
            let user = MWUser(id: id, name: userName, phone: phone, address: address)
            
            completion(.success(user))

        }
    }
}



