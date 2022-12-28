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
    
    var body: some View {
        if (vm.isBusy) {
            ProgressView()
        } else {
            NavigationView {
                VStack{
                    HomeHeader()
                        .padding()
                    Divider()
                        .background(Color.white)
                        .opacity(0.4)
                    ActionsView(open: $openNotification, title: "Quick Shortcuts", items: quickShortcuts, sTitle: $title, sIcon: $icon)
                        .padding()
                    Divider()
                        .background(Color.white)
                        .opacity(0.4)
                    ActionsView(open: $openNotification, title: "Recent Actions", items: recentItems, sTitle: $title, sIcon: $icon)
                        .padding()
                    Divider()
                        .background(Color.white)
                        .opacity(0.4)
                    /*
                     if openNotification {
                     if (title == "Media Controls"){
                     MediaPlayerWidget()
                     .zIndex(1)
                     .transition(.move(edge: .bottom))
                     }
                     else if (title == "Charging"){
                     ChargingWidget(open: $openNotification)
                     .zIndex(1)
                     .transition(.move(edge: .bottom))
                     }
                     else {
                     ActionNotification(open: $openNotification, icon: icon, text: title)
                     .zIndex(1)
                     .transition(.move(edge: .bottom))
                     }
                     }
                     */
                }
                .navigationBarTitle(Text("Doorbell Settings"), displayMode: .inline)
            }
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

