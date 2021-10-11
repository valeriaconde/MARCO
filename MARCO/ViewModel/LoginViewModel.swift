//
//  LoginViewModel.swift
//  MARCO
//
//  Created by Valeria Conde on 10/7/21.
//

import Foundation

class LoginViewModel : ObservableObject {
    var username : String = UserDefaults.standard.string(forKey: "username") ?? ""
    var password : String = UserDefaults.standard.string(forKey: "password") ?? ""
    
    @Published var isLoggedIn : Bool = false
    
    func login() {
        Webservice().login(username: username, password: password) { result in
            switch (result) {
            case .success(let token):
                print(token)
                DispatchQueue.main.async {
                    self.isLoggedIn = true
                }
                
                UserDefaults.standard.setValue(self.username, forKey: "username")
                UserDefaults.standard.setValue(self.password, forKey: "password")
                UserDefaults.standard.setValue(token, forKey: "token")
            
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoggedIn = false
                }
                print(error)
            }
            
        }
    }
    
    
    func logout()  {
        DispatchQueue.main.async {
            self.isLoggedIn = false
        }
    }
    
    func signUp(username: String, password: String) {
        Webservice().signUp(username: username, password: password) { result in
            
            switch (result) {
            case .success(let succ):
                print(succ)
                DispatchQueue.main.async {
                    self.isLoggedIn = true
                }
                
                UserDefaults.standard.setValue(self.username, forKey: "username")
                UserDefaults.standard.setValue(self.password, forKey: "password")
            
            case .failure(let error):
                print(error)
                
                DispatchQueue.main.async {
                    self.isLoggedIn = false
                }
            }
            
        }
    }
}
