//
//  CapsulaArtista.swift
//  prueba
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct CapsulaArtista: View {
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack{
                    VStack{
                        ArtistImage()
                        Script()
                        Divider()
                            .frame(width: 350, height: 1.0)
                        ExpoButton()
                        Divider()
                            .frame(width: 350, height: 1.0)
                        
                    }
                    
                }
            }
        }
        
    }
}

struct CapsulaArtista_Previews: PreviewProvider {
    static var previews: some View {
        CapsulaArtista()
    }
}
