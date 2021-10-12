//
//  AudioguiasSection.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct AudioguiasView: View {
    var body: some View {
        HStack{
            Gimage(name: "audioguia1_Explorer")
            Gimage(name: "audioguia2_Explorer")
            Gimage(name: "audioguia3_Explorer")
        }
    }
}

struct AudioguiasSection_Previews: PreviewProvider {
    static var previews: some View {
        AudioguiasView()
    }
}
