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
                Head(title: "#PERFIL")
                ZStack {
                    Box(ColorName: "LightBlue")
                    VStack {
                        Avatar(userName: "Lorena")
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
                        Counters()
                        
                    }
                }
                Spacer()
                ZStack {
                    Box(ColorName: "Sienna")
                    VStack {
                        
                        Text("Posts")
                            .font(.title)
                            .frame(width: 280, height: 10, alignment: .leading)
                        
                        PostsView()
                        Spacer()
                    }
                    .padding(.top, 30)
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
