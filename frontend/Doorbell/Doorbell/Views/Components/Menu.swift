//
//  Menu.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI

struct Menu: View {
    @Binding var sIcon: String
    @Binding var sText: String
    var views: [AnyView]
    var items: [Item]
    
    var body: some View {
        ForEach(Array(items.enumerated()), id: \.offset) { index, item in
            MenuItem(newView: views[index], icon: item.icon, text: item.text)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(sIcon: .constant("folder"), sText: .constant("Test"), views: [], items: [])
    }
}
