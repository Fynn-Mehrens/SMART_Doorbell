//
//  GeneralButton.swift
//  Doorbell
//
//  Created by Cora Bleier on 01.01.23.
//

import SwiftUI

struct GeneralButton: View {
    var icon: String
    
    var body: some View {
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.07), in: Circle())
            .innerShadow(shape: Circle(), color: .white.opacity(0.25), lineWidth: 2, offsetX: 1, offsetY: 1, blur: 1, blendMode: .luminosity)
    }
}

struct GeneralButton_Previews: PreviewProvider {
    static var previews: some View {
        GeneralButton(icon: "bell.fill")
    }
}
