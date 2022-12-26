//
//  Lazy.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

/// Actual lazy view construction without SwiftUI DSL caching.
struct LazyConstructionView<Content>: View where Content: View {
    /// Should the view currently be visible?
    @Binding private var visible: Bool
    /// The view to construct.
    private var content: () -> Content

    /// Creates a new *LazyConstructionView* instance.
    ///
    /// - Parameters:
    ///   - visible: A binding to a Boolean value that determines whether to present the view.
    ///   - content: The content to present.
    ///
    /// - Returns: The newly created *LazyConstructionView* instance.
    fileprivate init(visible: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) {
        self._visible = visible
        self.content = content
    }

    /// The inner *LazyConstructionView* structure.
    var body: some View {
        if self.visible {
            self.content()
        } else {
            EmptyView()
        }
    }
}

// swiftlint:disable line_length

/// View extension that adds support for a lazy variation of the fullscreen cover.
extension View {
    /// Presents a modal view that covers as much of the screen as possible when binding to a Boolean value you provide is true.
    ///
    /// Use this method to show a modal view that covers as much of the screen as possible.
    /// The example below displays a custom view when the user toggles the value of the isPresenting binding:
    ///
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the sheet.
    ///   - onDismiss: The closure to execute when dismissing the modal view.
    ///   - content: A closure that returns the content of the modal view.
    ///
    /// - Returns: The modified view.
    @ViewBuilder func lazyFullScreenCover<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content: View {
        self.fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
            LazyConstructionView(visible: isPresented, content: content)
        }
    }

    /// Presents a sheet when a binding to a Boolean value that you provide is true.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the sheet that you create in the modifier’s content closure.
    ///   - onDismiss: The closure to execute when dismissing the sheet.
    ///   - content: A closure that returns the content of the sheet.
    ///
    /// - Returns: The modified view.
    @ViewBuilder func lazySheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content: View {
        self.sheet(isPresented: isPresented, onDismiss: onDismiss) {
            LazyConstructionView(visible: isPresented, content: content)
        }
    }
}

// swiftlint:enable line_length
