//
//  Bloque.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct ExposicionesView: View {
    var body: some View {
        VStack{
            ZStack {
                NavigationLink(
                    destination: ExpoView(),
                    label: {
                        Image("index5")
                            .resizable()
                            .overlay(Rectangle().stroke(Color.black,lineWidth: 2.5))
                            .cornerRadius(10)
                            .padding(.all)
                            .frame(height: 250)
                    })
             //   Text("La Exposicion")
               //     .foregroundColor(.white)
                 //   .font(.title)
            }
            ZStack {
                Image("index6")
                    .resizable()
                    .overlay(Rectangle().stroke(Color.black,lineWidth: 2.5))
                    .cornerRadius(10)
                    .padding(.all)
                    .frame(height: 250)
                 
                    //Text("Farsa y Artificio")
                      //  .foregroundColor(.white)
                        //.font(.title)
                
            }
        }
        
    }
}

struct Bloque_Previews: PreviewProvider {
    static var previews: some View {
        ExposicionesView()
    }
}
