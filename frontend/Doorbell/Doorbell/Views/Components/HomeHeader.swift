//
//  HomeHeader.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
//

import SwiftUI

struct HomeHeader: View {
    @EnvironmentObject var vm: UserStateViewModel
    var profilName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Bell".uppercased())
                    .font(.caption2)
                    .fontWeight(.medium)
                    .padding(.vertical, 4)
                    .padding(.horizontal,8)
                    .background(Color("Red"))
                    .foregroundColor(Color.white)
                    .clipShape(Capsule())
                
                Text(profilName)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            }
            Spacer()
            HStack{
                NavigationLink (
                    destination: SettingsView()
                ) {
                    GeneralButton(icon: "gearshape.fill")
                }
                Button {
                    Task{
                        await vm.signOut()
                    }
                } label: {
                    Image(systemName:  "rectangle.portrait.and.arrow.right")
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                        .background(Color.white.opacity(0.07), in: Circle())
                        .innerShadow(shape: Circle(), color: .white.opacity(0.25), lineWidth: 2, offsetX: 1, offsetY: 1, blur: 1, blendMode: .luminosity)
                }
            }
        }
        .padding(.top)
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader(profilName: "Max")
    }
}
