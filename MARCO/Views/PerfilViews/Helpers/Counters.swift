//
//  Counters.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct Counters: View {
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("            ")
                .foregroundColor(.white)
            Text("0")
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        HStack {
            Text("visitas")
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("|")
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("posts")
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}
