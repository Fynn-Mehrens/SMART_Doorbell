//
//  ProfilView.swift
//  Doorbell
//
//  Created by Cora Bleier on 01.01.23.
//

import SwiftUI

struct ProfilView: View {
    var profilName: String
    
    var body: some View {
        VStack {
            ImageView()
            Text(profilName)
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(profilName: "Max Mustermann")
    }
}
