//
//  Control.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
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
