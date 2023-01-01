//
//  Action.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
//

import Foundation

struct ActionModel: Hashable {
    var icon: String
    var text: String
}

let menuItems: [ActionModel] = [
    ActionModel(icon: "person.circle.fill", text: "Profil"),
    ActionModel(icon: "bell.fill", text: "Notifications"),
    ActionModel(icon: "power.circle.fill", text: "Activate/Deactivate")
]

let quickShortcuts: [ActionModel] = [
    ActionModel(icon: "questionmark", text: "Test"),
    ActionModel(icon: "questionmark", text: "Test"),
    ActionModel(icon: "questionmark", text: "Test"),
    ActionModel(icon: "questionmark", text: "Test")
]

let recentItems: [ActionModel] = [
    ActionModel(icon: "questionmark", text: "Test"),
    ActionModel(icon: "questionmark", text: "Test"),
    ActionModel(icon: "questionmark", text: "Test")
]

