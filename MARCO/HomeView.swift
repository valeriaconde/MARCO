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
                ScrollView{
                    VStack{
                        VStack(spacing: 30){
                        Image("logomarco")
                            .resizable()
                            .scaledToFit()
                            .fixedSize()
                            .padding(55)
                            .ignoresSafeArea()
                            .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("#EXPLORER")
                            .foregroundColor(Color("Rosa"))
                            
                            
                        }
                        
                        VStack(alignment:.leading, spacing:10){
                            Text("Exposiciones")
                            .foregroundColor(.white)
                                .font(.title)
                            .bold()
                            .padding(.horizontal, 20)
                        
                            
                        
                        ZStack {
                            NavigationLink(
                                destination: ContentView(),
                                label: {
                                    Image("explorerM_Home")
                                        .resizable()
                                        .overlay(Rectangle().stroke(Color.black,lineWidth: 2.5))
                                        .cornerRadius(10)
                                        .padding(.all)
                                        .frame(height: 250)
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
                                        .padding(.all)
                                        .frame(height: 250)
                                })
                            Text("La Exposicion")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        VStack(alignment: .leading){
                            Text("Capsulas de artistas")
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 20)
                                .font(.title)
                            ScrollView(.horizontal){
                            HStack{
                                VStack {
                                    Image("MaGa_Explorer")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100)
                                        .padding()
                                        .overlay(Circle().stroke(Color.black, lineWidth: 2.5))
                                        .padding(.horizontal, 5)
                                    Text("MARIO GARCIA")
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                VStack {
                                    Image("RaLo_Explorer")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                        .padding()
                                        .overlay(Circle().stroke(Color.black, lineWidth: 2.5))
                                        .padding(.horizontal, 5)
                                    Text("MELANIE SMITH")
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                VStack {
                                    Image("MaSm_Explorer")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                        .padding()
                                        .overlay(Circle().stroke(Color.black, lineWidth: 2.5))
                                        .padding(.horizontal, 5)
                                    Text("RAFAEL LOZANO")
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                VStack {
                                    
                                    Image("Ca&Mi_Explorer")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                        .padding()
                                        .overlay(Circle().stroke(Color.black, lineWidth: 2.5))
                                        .padding(.horizontal, 5)
                                    Text("CARDIFF & MILLER")
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                    
                                    
                                    
                                }
                            }
                        }
                        VStack(alignment: .leading){
                            Text("Videos")
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 20)
                                .font(.title)
                            ScrollView(.horizontal) {
                                HStack{
                                    Image("video1_Explorer")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(3.0)
                                        .frame(width: 370)
                                    Image("video2_Explorer")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(3.0)
                                        .frame(width: 370)
                                }
                            }
                        }
                        VStack(alignment: .leading){
                            Text("Audio Guias")
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 20)
                                .font(.title)
                            ScrollView(.horizontal) {
                                HStack{
                                    Image("audioguia1_Explorer")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(3.0)
                                        .frame(width: 370)
                                    Image("audioguia2_Explorer")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(3.0)
                                        .frame(width: 370)
                                    Image("audioguia3_Explorer")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(3.0)
                                        .frame(width: 370)
                                }
                            }
                        }
                        VStack(alignment: .leading){
                            Text("Recorrido 3D")
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 20)
                                .font(.title)
                            
                            Image("marco3D")
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(5)
                                .padding(5)
                            
                        }
                    }//Vstack principal
 
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

