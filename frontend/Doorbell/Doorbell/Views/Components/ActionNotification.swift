//
//  Action.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
//

import SwiftUI

struct ActionNotification: View {
    @Binding var open: Bool
    var icon: String
    var text: String
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: icon)
                    .imageScale(.large)
                Text(text)
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    withAnimation {
                        open = false
                    }
                }){
                    Text("Cancel")
                        .foregroundColor(Color.white.opacity(0.7))
                        .background(Color.gray)
                }
                
            }
            .padding(20)
            .foregroundColor(Color.white)
            .background(Color.gray)
            .backgroundBlur(radius: 10, opaque: true)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding()
        
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ActionNotification_Previews: PreviewProvider {
    static var previews: some View {
        ActionNotification(open: .constant(true), icon: "bell.fill", text: "Test")
    }
}
