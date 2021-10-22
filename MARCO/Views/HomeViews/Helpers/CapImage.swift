//
//  CapImage.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct CapImage: View {
    let nImage : String
    let nArtist : String
    var body: some View {
        VStack {
            Image(nImage)
                .resizable()
                .scaledToFill()
                .frame(width: 100)
                .overlay(Circle().stroke(Color.black, lineWidth: 2.5))
                .padding(.horizontal, 5)
                .clipShape(Circle())
                .padding()
            Text(nArtist)
                .foregroundColor(.black)
                .bold()
        }

    }
}

/*struct CapImage_Previews: PreviewProvider {
    static var previews: some View {
        CapImage()
    }
} */
