//
//  LoginView.swift
//  MARCO
//
//  Created by user195184 on 9/7/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        ZStack{
            Image("LoginBackground")
                .resizable()
                .ignoresSafeArea()
        
            VStack{
                Image("logomarco")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 280, height: 280, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                Text("#MUSEODETODOS")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    
                
                VStack(alignment: .center, spacing: -40){
                    TextField("Usuario",text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 180, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    TextField("Contrasena", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 180, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.padding()
                
                VStack(spacing:50){
                Button(action:{
                    print("Hello World")
                })
                {
                    Text("Ingresar")
                        .frame(width: 200 , height: 50, alignment: .center)

                }
                    .foregroundColor(.white)
                    .background(Color("BotonIngresar"))
                    .frame(width: 100)
                
                    
                

            
                    VStack(spacing:0){
                Text("¿No tienes cuenta?")
                    .foregroundColor(.white)
                Text("Registrate Aqui")
                    .foregroundColor(.blue)
                    }
                
                Text("Continuar como invitado")
                    .foregroundColor(.white)
                
                }
            }
        }
        
     
    
    }
    


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
}
