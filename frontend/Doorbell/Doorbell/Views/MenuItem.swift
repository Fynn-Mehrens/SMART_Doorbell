//
//  MenuItem.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI
import Foundation

var profilName = "Cora Bleier"

struct Item: Hashable {
    var icon: String
    var text: String
}

var menuViews: [AnyView] = [
    AnyView(ProfilView(profilName: profilName)),
    AnyView(SettingsView()),
    AnyView(Text("Subscribe")),
    AnyView(ControlsView())
]

let menuItems: [Item] = [
    Item(icon: "person.circle.fill", text: "Profil"),
    Item(icon: "bell.fill", text: "Notifications"),
    Item(icon: "gearshape.fill", text: "Subscribe"),
    Item(icon: "power.circle.fill", text: "Activate/Deactivate")
]

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
