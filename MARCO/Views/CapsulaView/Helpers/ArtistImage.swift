//
//  Avatar.swift
//  prueba
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct ArtistImage: View {
    var body: some View {
        
        VStack{
            Image("Ai Weiwei")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 1))
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 0)
            
            Text("Michael Smith")
                .font(.title)
                .foregroundColor(.black)
                .padding(.bottom)
                
                
                //.frame(width: 0, height: 0, alignment: .center)
                
            
        }
    }
}

struct ArtistImage_Previews: PreviewProvider {
    static var previews: some View {
        ArtistImage()
    }
}
