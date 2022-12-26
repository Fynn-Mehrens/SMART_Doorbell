//
//  DismissView.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

/// The dismiss button used in *Sheet* and *QRCodeResultView*.
struct DismissView: View {
    /// The inner *DismissView* structure.
    var body: some View {
        Image(systemName: "xmark.circle.fill")
            .font(.system(size: 32))
            .foregroundColor(.dismissForeground)
            .opacity(1.0)
            .background(Color.dismissBackground
                            .mask(Circle().inset(by: 8)))
            .padding()
    }
}

/// *DismissView* previews for color schemes *.light* and *.dark*.
struct DismissView_Previews: PreviewProvider {
    /// The group of views displayed as the preview.
    static var previews: some View {
        Group {
            DismissView()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Light Color Scheme")

            DismissView()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Dark Color Scheme")
                .preferredColorScheme(.dark)
        }
        .padding()
    }
}
