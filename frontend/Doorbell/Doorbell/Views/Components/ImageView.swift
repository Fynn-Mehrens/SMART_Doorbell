//
//  ImageView.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        return Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
