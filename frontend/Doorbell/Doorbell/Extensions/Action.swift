//
//  Action.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

// swiftlint:disable line_length

/// Represents the *ActionableView* of the discover page to perform actions on the given content.
struct ActionableView<Content>: View where Content: View {
    /// Is the trip action sheet visible?
    @State private var actionSheetOpen: Bool = false
    /// Defines the options of the key value pair.
    let options: KeyValuePairs<String, (() -> Void)>
    /// Checks wether or not the view is available.
    let available: Bool
    /// Function to skip to the next image.
    let onTap: (() -> Void)
    /// Defines the content of the view.
    let content: (() -> Content)

    /// Creates an *ActionableView* instance.
    ///
    /// - Parameters:
    ///    - option: Contains an array of Strings which defines the options.
    ///    - available: Boolean which indicates wether the sheet is available.
    ///    - onTap: Skips to the next image when tapping on the view.
    ///    - content: Defines the content of the view.
    ///
    /// - Returns: The newly created instance of *ActionableView*.
    init(options: KeyValuePairs<String, (() -> Void)> = [:], available: Bool, onTap: @escaping (() -> Void) = {}, @ViewBuilder content: @escaping () -> Content) {
        self.options = options
        self.available = available
        self.onTap = onTap
        self.content = content
    }

    /// The inner *ActionableView* structure.
    var body: some View {
        content()
            .onTapGesture {
                /* Fixes scroll issue */
                self.onTap()
            }
            .onLongPressGesture {
                if self.available {
                    withAnimation {
                        self.actionSheetOpen = true
                    }
                }
            }
            .actionSheet(isPresented: self.$actionSheetOpen) {
                ActionSheet(title: Text("more-options"), buttons: self.options.filter { !$0.key.hasPrefix("ignore") }.map {
                    if $0.key.hasPrefix("destructive-") {
                        return ActionSheet.Button.destructive(Text(LocalizedStringKey(stringLiteral: $0.key)),
                                                              action: $0.value)
                    } else {
                        return ActionSheet.Button.default(Text(LocalizedStringKey(stringLiteral: $0.key)),
                                                          action: $0.value)
                    }
                } + [
                    .cancel(Text("dismiss"))
                ])
            }
    }
}

/// A *View* extension to generate a actionable View.
extension View {
    ///  Defines on the discover page where you can tap to display the following image.
    ///
    /// - Parameter options: Array of Strings defining the options.
    ///
    /// - Returns: The modified view.
    @ViewBuilder func actionable(options: KeyValuePairs<String, (() -> Void)>, available: Bool = true, onTap: @escaping (() -> Void) = {}) -> some View {
        ActionableView(options: options, available: available, onTap: onTap) {
            self
        }
    }
}

/// *ActionableView* previews.
struct ActionableView_Previews: PreviewProvider {
    /// The views displayed as the preview.
    static var previews: some View {
        ActionableView(options: [
            "test": {},
            "destructive-test": {}
        ], available: true) {
            Text("Hello World!")
        }
    }
}

// swiftlint:enable line_length
