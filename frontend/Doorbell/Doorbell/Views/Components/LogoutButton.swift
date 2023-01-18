//
//  LogoutButton.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI

/// Defining the look of the logout button
///
/// - since: 18.01.2023
struct LogoutButton: View {
    @EnvironmentObject var vm: UserStateViewModel
    
    var body: some View {
        Button(action: {
            Task.init {
                await vm.signOut()
            }
            
        }) {
            HStack {
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                Text("Logout")
                
            }
        }.foregroundColor(Color.white)
    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton()
    }
}
