//
//  ActionView.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
//

import SwiftUI

struct ActionsView: View {
    @Binding var open: Bool
    var title: String
    var items: [ActionModel]
    
    @Binding var sTitle: String
    @Binding var sIcon: String
    var body: some View {
        VStack(alignment: .leading) {
            ActionViewHeader(title: title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top){
                    ForEach(items, id: \.self){ item in
                        Button(action: {
                            sTitle = item.text
                            sIcon = item.icon
                            withAnimation {
                                open = true
                            }
                        }){
                            ActionItem(icon: item.icon, text: item.text)
                        }
                    }
                    
                    
                }
            }
            
        }
    }
}

struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsView(open: .constant(true), title: "Test", items: [], sTitle: .constant("Test"), sIcon: .constant("bell.fill"))
    }
}
