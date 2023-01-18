//
//  HomeScreen.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: UserStateViewModel
    @State private var openNotification = false
    @State private var title = ""
    @State private var icon = ""
    var profilName: String
    
    var body: some View {
        if (vm.isBusy) {
            ProgressView()
        } else {
            NavigationView {
                VStack{
                    ImageView()
                    HomeHeader(profilName: profilName)
                        .padding()
                    Divider()
                        .background(Color.white)
                        .opacity(0.4)
                    ActionsView(open: $openNotification, sTitle: $title, sIcon: $icon, title: "Menu", items: menuItems)
                    Divider()
                        .background(Color.white)
                        .opacity(0.4)
                    
                    if openNotification {
                        if (title == "Profil") {
                            NavigationLink("Show Profil") {
                                ProfilView(profilName: profilName)
                            }
                        } else if (title == "Notifications") {
                            NavigationLink("Show Notification Settings") {
                                SettingsView()
                            }
                        } else if (title == "Logout") {
                            //Task{
                                //await vm.signOut()
                            //}
                        } else {
                            ActionNotification(open: $openNotification, icon: icon, text: title)
                                .zIndex(1)
                                .transition(.move(edge: .bottom))
                        }
                    }
                }
                .navigationBarTitle(Text("Doorbell Settings"), displayMode: .inline)
            }
        }
    }
}

struct ContenView_Previews: PreviewProvider {
    static let userStateViewModel = UserStateViewModel()
    static var previews: some View {
        ContentView(profilName: "Max")
            .environmentObject(userStateViewModel)
        
    }
}

