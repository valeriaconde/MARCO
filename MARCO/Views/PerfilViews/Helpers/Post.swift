//
//  Post.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct Post: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: 95, height: 95)
    }
}
