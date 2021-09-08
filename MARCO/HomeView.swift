//
//  HomeView.swift
//  MARCO
//
//  Created by user195184 on 9/7/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Beige")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    VStack{
                    Image("logomarco")
                        .resizable()
                        .scaledToFit()
                        .fixedSize()
                        .padding(55)
                        .ignoresSafeArea()
                        .frame(width: 100, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("#EXPLORER")
                        .foregroundColor(Color("Rosa"))
                        
                    }
                    
                    VStack(alignment:.leading, spacing:10){
                        Text("Exposiciones")
                        .foregroundColor(.white)
                        .bold()
                    
                        
                    
                    ZStack {
                        NavigationLink(
                            destination: ContentView(),
                            label: {
                                Image("explorerM_Home")
                                    .resizable()
                                    .overlay(Rectangle().stroke(Color.black,lineWidth: 5))
                            })
                        
                         
                            Text("Farsa y Artificio")
                                .foregroundColor(.white)
                                .font(.title)
                        
                    }
                    }
                    ZStack {
                        NavigationLink(
                            destination: ContentView(),
                            label: {
                                Image("reservaciones_Home")
                                    .resizable()
                                    .overlay(Rectangle().stroke(Color.black,lineWidth: 2.5))
                                    .cornerRadius(10)
                            })
                        Text("La Exposicion")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
