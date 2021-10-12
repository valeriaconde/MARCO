//
//  Head.swift
//  MARCO
//
//  Created by user192207 on 10/11/21.
//

import SwiftUI

struct Head: View {
    let title : String
    var body: some View {
        VStack{
            Image("logomarco")
                .resizable()
                .scaledToFill()
                .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(title)
                .foregroundColor(Color("Rose"))

        }
        .padding(.top, -80.0)
    }
}

struct Head_Previews: PreviewProvider {
    static var previews: some View {
        Head(title: "String")
    }
}
