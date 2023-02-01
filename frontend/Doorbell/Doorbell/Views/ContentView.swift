//
//  HomeScreen.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

var dbRingValue: [DoorbellRing] = []

struct ContentView: View {
    @EnvironmentObject var vm: UserStateViewModel
    @State private var icon = ""
    @State private var text = ""
    @State var notification = ""
    
    var body: some View {
        if (vm.isBusy) {
            ProgressView()
        } else {
            VStack {
                NavigationView {
                    VStack{
                        ImageView().padding()
                        Text(profilName)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        
                        Divider()
                            .background(Color.white)
                            .opacity(0.4)
                        
                        List {
                            Menu(sIcon: $icon, sText: $text, views: menuViews, items: menuItems)
                            LogoutButton()
                            HStack {
                                Text(notification)
                                ForEach(Array(dbRingValue.enumerated()), id: \.offset) { index, item in
                                    Text(item.time)
                                }
                            }.task {
                                do {
                                    getDoorbellRings()
                                    print("Here")
                                    if !dbRingValue.isEmpty {
                                        print(dbRingValue[1].time)}
                                    else {
                                        print("No Data to fetch")
                                    }
                                }
                            }
                            .onAppear {
                                print(notification)
                                notification = "The doorbell has been rung. - 7s ago"
                                
                            }
                        }
                        
                    }.scrollDisabled(true)
                }
                .navigationBarTitle(Text("Doorbell Settings"), displayMode: .inline)
            }.navigationBarTitle("Menu")
            
        }
    }
}

func getDoorbellRings() {
    get() { receivedDoorbellRings in
        dbRingValue = receivedDoorbellRings
    }
}

struct ContenView_Previews: PreviewProvider {
    static let userStateViewModel = UserStateViewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(userStateViewModel)
        
    }
}

