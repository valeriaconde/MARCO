//
//  Avatar.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct Avatar: View {
    let userName : String
    var body: some View {
        Image("avatar")
            .resizable()
            .scaledToFit()
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(lineWidth: 1))
            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        Text(userName)
            .font(.title)
            .foregroundColor(.white)
    }
}


