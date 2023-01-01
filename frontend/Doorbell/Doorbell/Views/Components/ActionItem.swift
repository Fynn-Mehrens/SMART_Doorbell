//
//  ActionItem.swift
//  Doorbell
//
//  Created by Cora Bleier on 01.01.23.
//

import SwiftUI

struct ActionItem: View {
    var icon: String
    var text: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 5){
            
            GeneralButton(icon: icon)
            Text(text)
                .frame(width: 80)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
        }
    }
}

struct ActionItem_Previews: PreviewProvider {
    static var previews: some View {
        ActionItem(icon: "bell.fill", text: "Test")
    }
}
