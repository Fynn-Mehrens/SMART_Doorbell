//
//  LoginButton.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI

struct LoginButtonContent: View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.white)
            .cornerRadius(15.0)
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonContent()
    }
}
