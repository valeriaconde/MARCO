//
//  CapArtistas.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct CapuslasView: View {
    var body: some View {
        HStack{
            
            NavigationLink(
                destination: CapsulaArtista(),
                label: {
                    CapImage(nImage: "Ai Weiwei", nArtist: "AI WEIWEI")
                })
                
            
                CapImage(nImage: "MaSm_Explorer", nArtist: "MELANIE SMITH")
                CapImage(nImage: "RaLo_Explorer", nArtist: "RAFAEL LOZANO")
                CapImage(nImage: "Ca&Mi_Explorer", nArtist: "CARDIFF & MILLER")
                
        }
    }
}

struct CapArtistas_Previews: PreviewProvider {
    static var previews: some View {
        CapuslasView()
    }
}
