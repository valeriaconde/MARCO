//
//  UsersViewModel.swift
//  MARCO
//
//  Created by Valeria Conde on 10/10/21.
//

import Foundation

class UsersViewModel : ObservableObject {
    @Published var users = [UserModel]()
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        Webservice().getUsers() { result in
            switch result {
            case .success(let userResult):
                print("Obtuvo los usuarios")
                self.users = userResult.users
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
