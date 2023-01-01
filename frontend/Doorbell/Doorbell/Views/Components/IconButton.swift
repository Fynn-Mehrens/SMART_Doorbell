//
//  IconButton.swift
//  Doorbell
//
//  Created by Cora Bleier on 01.01.23.
//

import SwiftUI

struct IconButton: View {
    var icon: String
    var text: String
    var body: some View {
        Button(action: {}){
            Label(text, systemImage: icon)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .background(Color.white.opacity(0.09))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(icon: "bell.fill", text: "TEST")
    }
}
