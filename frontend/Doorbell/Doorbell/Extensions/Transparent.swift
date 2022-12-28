//
//  Transparent.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

/// A *ViewModifier* clearing a `List` background.
struct TransparentListBackground: ViewModifier {
    /// Gets the current body of the caller.
    ///
    /// - Parameter content: Is a proxy for the view that will have the modifier represented by `Self` applied to it.
    ///
    /// - Returns: The modified view.
    func body(content: Content) -> some View {
        content
            .background(Color.clear)
            .onAppear {
                if UITableView.appearance().backgroundColor != .clear
                    || UITableViewCell.appearance().backgroundColor != .clear {
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().backgroundColor = .clear
                }
            }
    }
}
