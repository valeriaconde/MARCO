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
                        Head(title: "#Explorer")
                        
                        VStack(alignment:.leading, spacing:10){
                        
                            NameSection(nameSection: "Exposiciones")
                            ExposicionesView()
                        }
                            
                        
                        VStack(alignment: .leading){
                           NameSection(nameSection: "Capsula de artistas")
                            ScrollView(.horizontal){
                                CapuslasView()
                            
                            }
                        }
                        VStack(alignment: .leading){
                            NameSection(nameSection: "Videos")
                            ScrollView(.horizontal) {
                                VideosView()
                                
                            }
                        }
                        VStack(alignment: .leading){
                            NameSection(nameSection: "Audioguias")
                            ScrollView(.horizontal) {
                                AudioguiasView()
                            }
                        }
                        VStack(alignment: .leading){
                            Text("Recorrido 3D")
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 20)
                                .font(.title)
                            
                            NavigationLink(
                                destination: WebView(html: "https://www.museomarco.360s.mx/"),
                                label: {
                                Image("marco3D")
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(5)
                                    .padding(5)
                                })
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

