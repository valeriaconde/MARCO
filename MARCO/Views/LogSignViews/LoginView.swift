//
//  LoginView.swift
//  MARCO
//
//  Created by Diego Rodriguez on 08/09/21.
//

import SwiftUI

struct LoginView: View {
    
   // @State private var username: String = ""
   // @State private var password: String = ""
    @State var showSignUp : Bool = false
    
    @EnvironmentObject private var loginVM : LoginViewModel
    
    @State private var showError = false
    
    //@Binding var signInSuccess: Bool
    
    var body: some View {
        ZStack {
            Image("LoginBackground")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("logomarco")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 280, height: 280, alignment: .center)
                    
                Text("#MUSEODETODOS")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    
                VStack(alignment: .center, spacing: -40){
                    TextField("Usuario",text: $loginVM.username)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 180, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Contraseña", text: $loginVM.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 180, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.padding()
                VStack(spacing: 40){
                Button(action: {
                    loginVM.login()
                    print("entro")
                }) {
                    Text("Ingresar")
                        .frame(width: 200 , height: 50, alignment: .center)
                }
                .foregroundColor(.white)
                .background(Color("BotonIngresar"))
                .frame(width: 100)
                
                
                if showError {
                    Text("Usuario/contraseña incorrecta").foregroundColor(Color.red)
                }
                VStack(spacing: 0){
                    
                    
                    Text("¿No tienes cuenta?")
                        .foregroundColor(.white)
                    
                    Button(action: {
                        showSignUp.toggle()
                        
                    }, label: {
                        Text("Registrate aquí")
                            .foregroundColor(.white)
                    })
                    .sheet(isPresented: $showSignUp, content: {
                        SignUpView()
                    })
                    
                    
                }
                Text("Continuar como invitado")
                    .foregroundColor(.white)
                }
            }
        }
    }
}
