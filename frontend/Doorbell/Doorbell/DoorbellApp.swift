//
//  DoorbellApp.swift
//  Doorbell
//
//  Created by Cora Bleier on 14.12.22.
//

import SwiftUI

@main
struct DoorbellApp: App {
    @StateObject var userStateViewModel = UserStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            ApplicationSwitcher(profileName: "Max Mustermann")
                .navigationViewStyle(.stack)
                .environmentObject(userStateViewModel)
        }
    }
}
