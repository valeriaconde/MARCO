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
            NavigationLink(
                destination: WebView(html: "https://www.youtube.com/watch?v=swhrA3qoqx4"),
                label: {
                    Gimage(name: "video1_Explorer")
                })
            NavigationLink(
                destination: WebView(html: "https://www.youtube.com/watch?v=dD8G-HH3HC8&t=1s"),
                label: {
                    Gimage(name: "video2_Explorer")
                })
            //Gimage(name: "video1_Explorer")
            //Gimage(name: "video2_Explorer")
        }
    }
}

struct VideosSection_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
