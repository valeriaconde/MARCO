//
//  HomeDynamic.swift
//  MARCO
//
//  Created by user195184 on 9/9/21.
//

import SwiftUI

struct HomeDynamic: View {
        @State private var selection = 1

           init() {
            UITabBar.appearance().barTintColor = UIColor(Color("Rose"))
           }
        
        var body: some View {
            TabView (selection:$selection){
                HomeView()
                    .tabItem {
                        Label("Menu", systemImage: "house.fill")
                    }.tag(1)
                Text("Tienda")
                    .tabItem { Label("Reservaciones", systemImage: "cart.fill")
                    }.tag(2)
                PerfilView()
                    .tabItem {
                        Label("Perfil", systemImage:"person.fill") }
            }.tag(3)

    }
}


struct HomeDynamic_Previews: PreviewProvider {
    static var previews: some View {
        HomeDynamic()
    }
}
