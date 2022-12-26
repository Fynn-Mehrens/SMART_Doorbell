//
//  HomeScreen.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var vm: UserStateViewModel

    var body: some View {

        if(vm.isBusy){
            ProgressView()
        }else{
            Text("Home Screen")
                .navigationTitle("Home")
                .toolbar {

                        Button {
                            Task{
                                await vm.signOut()
                            }
                        } label: {
                            Image(systemName:  "rectangle.portrait.and.arrow.right")
                        }


                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static let userStateViewModel = UserStateViewModel()
    static var previews: some View {
        HomeScreen()
            .environmentObject(userStateViewModel)
    }
}
