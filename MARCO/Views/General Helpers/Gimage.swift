//
//  Gimage.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct Gimage: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .cornerRadius(3.0)
            .frame(width: 370)
    }
}


