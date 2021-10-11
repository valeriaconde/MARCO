//
//  PerfilView.swift
//  MARCO
//
//  Created by Valeria Conde on 9/9/21.
//

import SwiftUI

struct PerfilView: View {
    
    @EnvironmentObject var loginVM : LoginViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image("logomarco")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("#PERFIL")
                    .foregroundColor(Color("Rose"))
                ZStack {
                    Color("LightBlue")
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 5))
                        .cornerRadius(40)
                        .frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack {
                        Image("avatar")
                            .resizable()
                            .scaledToFit()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(lineWidth: 1))
                            .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("NAME")
                            .font(.title)
                            .foregroundColor(.white)
                        NavigationLink(
                            destination: PerfilView(),
                            label: {
                                ZStack {
                                    Color("Blue")
                                        .clipShape(Rectangle())
                                        .cornerRadius(10)
                                        .frame(width: 120, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding(5)
                                    Text("editar perfil")
                                        .foregroundColor(.white)
                                }
                            })
                        HStack {
                            Text("0")
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Text("            ")
                                .foregroundColor(.white)
                            Text("0")
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                        HStack {
                            Text("visitas")
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Text("|")
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Text("posts")
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                Spacer()
                ZStack {
                    Color("Sienna")
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 5))
                        .cornerRadius(40)
                        .frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack {
                        Spacer()
                        Text("Posts")
                            .font(.title)
                            .frame(width: 280, height: 20, alignment: .leading)
                        HStack {
                            Image("post1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 95, height: 95)
                            Image("post2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 95, height: 95)
                            Image("post3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 95, height: 95)
                        }
                        HStack {
                            Image("post4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 95, height: 95)
                            Image("post5")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 95, height: 95)
                            Image("")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 95, height: 95)
                        }
                        Spacer()
                    }
                }
                Spacer()
                
                Button(action: {
                    loginVM.logout()
                }, label: {
                    Text("Log out")
                })
            }
        }
        
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
