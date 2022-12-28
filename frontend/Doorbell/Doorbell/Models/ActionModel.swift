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

