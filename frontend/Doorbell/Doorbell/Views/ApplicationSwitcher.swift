//
//  ApplicationSwitcher.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

struct ApplicationSwitcher: View {

    @EnvironmentObject var vm: UserStateViewModel

    var body: some View {
        if (vm.isLoggedIn) {
                HomeScreen()
        } else {
            LoginScreen()
        }

    }
}
