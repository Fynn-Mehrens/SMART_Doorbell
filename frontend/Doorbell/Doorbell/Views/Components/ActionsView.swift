//
//  ActionView.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
//

import SwiftUI

struct ActionsView: View {
    @Binding var open: Bool
    @Binding var sTitle: String
    @Binding var sIcon: String
    var title: String
    var items: [ActionModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            ActionViewHeader(title: title)
                .padding()
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
