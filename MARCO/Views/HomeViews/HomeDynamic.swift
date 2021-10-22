//
//  HomeDynamic.swift
//  MARCO
//
//  Created by user195184 on 9/9/21.
//

import SwiftUI

struct HomeDynamic: View {
    @State private var selected = 2
    
   init() {
    UITabBar.appearance().barTintColor = UIColor(Color("Rose"))
   }
    
    var body: some View {
        ZStack{
            TabView (selection:$selected){
                ReservacionesView()
                    .tabItem {
                        Image("ShopIcon")
                            .ignoresSafeArea()
                            .position(x: 50, y: 100)
                    }.tag(1)
                
                HomeView()
                    .tabItem {
                        //Image("MarcoIcon")
                    }.tag(2)
                
                PerfilView()
                    .tabItem {
                        //Image("PersonIcon")
                    }.tag(3)
            }
            
            /*
            HStack {
                Button(action: { self.selected = 1 } ) {
                    Image("ShopIcon")
                        .padding(1)
                        .position(x: 90, y: 805)
                }
                Button(action: { self.selected = 2 } ) {
                    Image("MarcoIcon")
                        .padding(10)
                        .position(x: 70, y: 806)
                }
                Button(action: { self.selected = 3 } ) {
                    Image("PersonIcon")
                        .padding(10)
                        .position(x: 60, y: 800)
                }
            }*/
        }
         // zstack
    } //body
}

struct HomeDynamic_Previews: PreviewProvider {
    static var previews: some View {
        HomeDynamic()
    }
}
