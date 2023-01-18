//
//  MenuItems.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI
import Foundation

struct Item: Hashable {
    var icon: String
    var text: String
}

var menuViews: [AnyView] = [
    AnyView(ProfilView(profilName: profilName)),
    AnyView(SettingsView()),
    AnyView(Text("Subscribe")),
    AnyView(Text("Activate/Deactivate"))
]

let menuItems: [Item] = [
    Item(icon: "person.circle.fill", text: "Profil"),
    Item(icon: "bell.fill", text: "Notifications"),
    Item(icon: "gearshape.fill", text: "Subscribe"),
    Item(icon: "power.circle.fill", text: "Activate/Deactivate")
]
