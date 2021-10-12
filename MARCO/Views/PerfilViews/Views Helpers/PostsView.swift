//
//  PostSet.swift
//  MARCO
//
//  Created by user192207 on 10/12/21.
//

import SwiftUI

struct PostsView: View {
    var body: some View {
        HStack{
            Post(name: "post1")
            Post(name: "post2")
            Post(name: "post3")
        }
        HStack{
            Post(name: "post4")
            Post(name: "post5")
            Post(name: "")
        }
    }
}

struct PostSet_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
