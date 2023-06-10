//
//  AuthService.swift
//  TastyCourse
//
//  Created by Константин on 10.06.2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    private init() {  } // гарантия того,что не будет создан еще экземпляр AuthService
    private let auth = Auth.auth() // хранится таблица с юзера и др свойства. Хранит ссылкy на файл в FireBase Authentication
    var currentUser: User? {// текущий юзер опциональный // User объект из FireBase
        return auth.currentUser
    }
    
    // метод создания юзера
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
