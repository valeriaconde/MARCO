//
//  MenuButton.swift
//  MARCO
//
//  Created by user192207 on 10/8/21.
//

import SwiftUI

struct MenuButton: View {
    @State var menuOpen: Bool = false
    
    var body: some View {
        ZStack {
            if !self.menuOpen {
                Button(action: {
                    self.openMenu()
                }, label: {
                    Image("menu")
                        .position(x:40)
                })
            }
            
            SideMenu(width: 270,
                     isOpen: self.menuOpen,
                     menuClose: self.openMenu)
        }
    }

    
    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton()
    }
}
