//
//  LoginView.swift
//  MARCO
//
//  Created by Valeria Conde on 9/7/21.
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
                 Image("Marco_whiteLogo")
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
                Button(action:{
                    print("Hello World")
                        })
                        {
                            Text("Registrate")
                                .frame(width: 200 , height: 27, alignment: .center)

                        }
                            .foregroundColor(.blue)
                            .background(Color("Nada"))
                           

                     }
                
                    

                    Button(action:{
                        print("Hello World")
                                })
                                {
                                    Text("Continuar como invitado")
                            .frame(width: 200 , height: 17, alignment: .center)

                                }
                        .foregroundColor(.blue)
                        .background(Color("Nada"))
                                   

                             
                    }

                 }
             }
         }
     }

 struct LoginView_Previews: PreviewProvider {
     static var previews: some View {
         LoginView()
     }
 }

