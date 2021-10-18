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
        ZStack{
            TabView (selection:$selection){
                HomeView()
                    .tabItem {
                        Image("ShopIcon")
                    }.tag(1)
                ReservacionesView()
                    .tabItem {
                        Image("MarcoIcon")
                    }.tag(2)
                PerfilView()
                    .tabItem {
                        Image("PersonIcon")
                    }.tag(3)
            }
            //MenuButton()
        }
    }
}

struct HomeDynamic_Previews: PreviewProvider {
    static var previews: some View {
        HomeDynamic()
    }
}
