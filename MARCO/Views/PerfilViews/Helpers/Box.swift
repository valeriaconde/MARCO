//
//  Box.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct Box: View {
    let ColorName : String
    var body: some View {
        Color(ColorName)
            .scaledToFit()
            .clipShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 5))
            .cornerRadius(40)
            .frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
