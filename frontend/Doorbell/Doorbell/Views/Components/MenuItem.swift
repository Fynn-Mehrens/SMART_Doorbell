//
//  MenuItem.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI

struct MenuItem: View {
    var newView: AnyView
    var icon: String
    var text: String
    
    var body: some View {
        NavigationLink(destination: newView) {
            Image(systemName:icon)
                .imageScale(.large)
                .frame(width: 44, height: 44)
            Text(text)
        }
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(newView: AnyView(ProfilView(profilName: "Max")), icon: "Person.fill", text: "Profil")
    }
}
