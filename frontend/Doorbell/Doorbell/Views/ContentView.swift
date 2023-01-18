//
//  HomeScreen.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: UserStateViewModel
    @State private var icon = ""
    @State private var text = ""
    
    var body: some View {
        if (vm.isBusy) {
            ProgressView()
        } else {
            NavigationView {
                VStack{
                    ImageView().padding()
                    Text(profilName)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                    Divider()
                        .background(Color.white)
                        .opacity(0.4)
                    
                    List {
                        Menu(sIcon: $icon, sText: $text, views: menuViews, items: menuItems)
                        LogoutButton()
                        
                    }.scrollDisabled(true)
                }
                .navigationBarTitle(Text("Doorbell Settings"), displayMode: .inline)
            }.navigationBarTitle("Menu")
        }
    }
}

struct ContenView_Previews: PreviewProvider {
    static let userStateViewModel = UserStateViewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(userStateViewModel)
        
    }
}

