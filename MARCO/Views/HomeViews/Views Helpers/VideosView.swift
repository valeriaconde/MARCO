//
//  VideosSection.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct VideosView: View {
    var body: some View {
        HStack{
            Gimage(name: "video1_Explorer")
            Gimage(name: "video2_Explorer")
        }
    }
}

struct VideosSection_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
