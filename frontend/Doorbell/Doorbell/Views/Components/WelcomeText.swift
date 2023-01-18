//
//  WelcomeText.swift
//  Doorbell
//
//  Created by Cora Bleier on 14.12.22.
//

import SwiftUI

struct WelcomeText: View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
        
    }
}

struct WelcomeText_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeText()
    }
}
