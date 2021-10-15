//
//  MenuContent.swift
//  MARCO
//
//  Created by user192207 on 10/8/21.
//

import SwiftUI

struct MenuContent: View {
    var body: some View {
        List {
            VStack{
                Image("avatar")
                .resizable()
                    .scaledToFit()
                    .frame(width:  70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Cerrar sesion")
                    .foregroundColor(.blue)
            }
            .position(x:110, y:50)
            .padding(/*@START_MENU_TOKEN@*/[.top, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
            
            HStack{
                Image("notification")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("NOTIFICACIONES").font(.subheadline)
                    .foregroundColor(.black)
            }.padding(/*@START_MENU_TOKEN@*/[.top, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
            
            HStack{
                Image("anuncio")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("ANUNCIOS").font(.subheadline)
                    .foregroundColor(.black)
            }.padding(/*@START_MENU_TOKEN@*/[.top, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
            
            HStack{
                Image("calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("EVENTOS").font(.subheadline)
                    .foregroundColor(.black)
            }.padding(/*@START_MENU_TOKEN@*/[.top, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
            
            HStack{
                Image("config")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("CONFIGURACIÓN").font(.subheadline)
                    .foregroundColor(.black)
            }.padding(/*@START_MENU_TOKEN@*/[.top, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct MenuContent_Previews: PreviewProvider {
    static var previews: some View {
        MenuContent()
    }
}
