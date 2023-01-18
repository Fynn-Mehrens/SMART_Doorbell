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
                
                Text(profilName)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
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
