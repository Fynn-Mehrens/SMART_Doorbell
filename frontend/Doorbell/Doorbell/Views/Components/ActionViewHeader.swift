//
//  ActionViewHeader.swift
//  Doorbell
//
//  Created by Cora Bleier on 01.01.23.
//

import SwiftUI

struct ActionViewHeader: View {
    var title: String
    var isEdit: Bool = false
    
    var body: some View {
        HStack(alignment: .center){
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            if isEdit{
                Button {
                    
                } label: {
                    Text("Edit")
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                }
            }
            
        }.padding(.top)
    }
}

struct ActionViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ActionViewHeader(title: "Test", isEdit: false)
    }
}
