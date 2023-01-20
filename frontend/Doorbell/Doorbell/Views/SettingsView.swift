//
//  SettingsView.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
//

import SwiftUI

struct SettingsView: View {
    @State private var icon = ""
    @State private var text = ""
    
    var body: some View {
        List {
            Menu(sIcon: $icon, sText: $text, views: settingsView, items: settingsItems)
        }.scrollDisabled(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
