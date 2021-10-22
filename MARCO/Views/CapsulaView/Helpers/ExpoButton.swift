//
//  ExpoButton.swift
//  prueba
//
//  Created by user192207 on 10/13/21.
//

import SwiftUI

struct ExpoButton: View {
    var body: some View {
        
        NavigationLink(
            destination: ExpoView(),
            label: {
                HStack{
                    VStack {
                        Text("Exposición en MARCO")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .frame(width: 330, alignment: .leading)
                            
                        Text("Enero - Marzo 2020")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                            .frame(width: 330, alignment: .leading)
                            
                    }
                    Image(systemName: "chevron.right")
                    
                }
                .padding(.vertical,10)
            })
    }
}

struct ExpoButton_Previews: PreviewProvider {
    static var previews: some View {
        ExpoButton()
    }
}
