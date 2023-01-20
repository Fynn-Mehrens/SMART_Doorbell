//
//  MenuItems.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI
import Foundation

var profilName = "Max Mustermann"

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

var settingsView: [AnyView] = [
    AnyView(EditMessageView()),
    AnyView(ChooseSoundView()),
    AnyView(ChangeScheduleView()),
    AnyView(ForwardNotificationView()),
    AnyView(ForwardSchedulingView())
]

let settingsItems: [Item] = [
    Item(icon: "square.and.pencil", text: "Notification Message"),
    Item(icon: "speaker.wave.3", text: "Notification Sound"),
    Item(icon: "clock.badge.questionmark", text: "Notification Schedule"),
    Item(icon: "square.and.arrow.up", text: "Notification Forwarding"),
    Item(icon: "calendar.badge.plus", text: "Scheduling to forward Notifications")
]
