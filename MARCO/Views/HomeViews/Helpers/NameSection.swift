//
//  NameSection.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct NameSection: View {
    let nameSection : String
    var body: some View {
        Text(nameSection)
            .foregroundColor(.black)
            .font(.title)
            .bold()
            .padding(.horizontal, 20)
    }
}

struct NameSection_Previews: PreviewProvider {
    static var previews: some View {
        NameSection(nameSection: "#")
    }
}
