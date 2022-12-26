//
//  Layout.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

// swiftlint:disable private_over_fileprivate

/// Displays the layout of type content.
struct Layout<Content>: View where Content: View {
    /// Layout size that takes two float values for width an height.
    @State private var size: (width: CGFloat, height: CGFloat)?
    /// Constructs the layout based on the available space.
    private var content: (CGFloat, CGFloat) -> Content

    /// Creates an layout of type content instance.
    ///
    /// - Parameter content: Contains two float values.
    init(@ViewBuilder content: @escaping (CGFloat, CGFloat) -> Content) {
        self.content = content
    }

    /// The inner body of the layout of type content.
    var body: some View {
        self.content(self.size?.width ?? 0, self.size?.height ?? 0)
            .frame(maxWidth: self.size == nil ? .infinity : nil,
                   maxHeight: self.size == nil ? .infinity : nil)
            .overlay(GeometryReader {
                Color.clear.preference(key: ViewSizeKey.self, value: $0.frame(in: .local).size)
            })
            .onPreferenceChange(ViewSizeKey.self) {
                if self.size == nil {
                    self.size = ($0.width, $0.height)
                }
            }
    }
}

/// File private layout preview  for *ViewSizeKey*.
fileprivate struct ViewSizeKey: PreferenceKey {
    /// The value of the ViewSizeKey
    typealias Value = CGSize
    ///  The default value of the ViewSizeKey which is set to zero.
    static var defaultValue: CGSize = .zero

    /// Updates the size to the new one.
    ///
    /// - Parameters:
    ///   - value: Of type size
    ///   - nextValue: Sets the value to next value.
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

/// Layout preview previews for color schemes *.light* and *.dark*.
struct Layout_Previews: PreviewProvider {
    /// Displays the width and height of the layout.
    static var previews: some View {
        Layout { width, height in
            Text("width: \(width) / height: \(height)")
                .frame(width: width * 0.9, height: height * 0.25, alignment: .center)
                .background(Color.red)
        }
    }
}

// swiftlint:enable private_over_fileprivate
