//
//  ExpoView.swift
//  MARCO
//
//  Created by Valeria Conde on 9/9/21.
//

import SwiftUI

struct ExpoView: View {
    
    var left = truet
    
    @StateObject var expo = ExpoModel()
    
    var body: some View {
        ZStack {
            Color("Beige")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
              
                
                VStack {
                    
                    ForEach(expo.expos) { item in
                        VStack {
                            Text(item.name)
                                .foregroundColor(Color("Rose"))
                                .font(.custom("Urbanist", size: 60))
                            
                                    VStack {
                                        
                                        Image(item.images[0])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:300)
                                            .position(x: 150, y: 150)
                                        
                                        Image(item.images[1])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:300)
                                            .position(x: 300, y: 200)
                                        
                                        Image(item.images[2])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:300)
                                            .position(x: 150, y: 250)
                                        
                                        Image(item.images[3])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:300)
                                            .position(x: 300, y: 300)
                                    }
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct ExpoView_Previews: PreviewProvider {
    static var previews: some View {
        ExpoView()
    }
}
