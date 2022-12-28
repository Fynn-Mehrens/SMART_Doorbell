//
//  Preence.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

/// Visibility extension for views.
extension View {
    /// Modifies the visibility state of the view.
    ///
    /// - Parameter isHidden: Is the view hidden.
    ///
    /// - Returns: The modified view instance.
    @ViewBuilder func hidden(_ isHidden: Bool) -> some View {
        if isHidden {
            EmptyView()
        } else {
            self
        }
    }
}

