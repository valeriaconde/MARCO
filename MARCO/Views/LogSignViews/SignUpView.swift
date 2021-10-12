//
//  SignUpView.swift
//  MARCO
//
//  Created by Valeria Conde on 10/9/21.
//

import SwiftUI

struct SignUpView: View {
    
    @State var username = ""
    @State var password = ""
    
    @EnvironmentObject var loginVM : LoginViewModel
    
    var body: some View {
        
        VStack {
            TextField("username", text: $username)
            SecureField("password", text: $password)
        
            Button(action: {
                loginVM.signUp(username: username, password: password)
            }, label: {
                Text("Sign up")
            })
        
        
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
