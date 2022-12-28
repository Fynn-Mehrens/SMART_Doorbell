//
//  Space.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import Combine
import SwiftUI

/// Spacer view wrapper to support fixed max or min height spacing.
struct HSpace: View {
    /// Can the space be expanded (true: minHeight, false: maxHeight).
    private let expand: Bool
    /// The spacer view frame height threshold.
    private let height: CGFloat

    /// Creates an *HSpace* instance.
    ///
    /// - Parameters:
    ///     - expand: Can the space be expanded (true: minHeight, false: maxHeight).
    ///     - height: The spacer view frame height threshold.
    private init(expand: Bool, height: CGFloat) {
        self.expand = expand
        self.height = height
    }

    /// Creates an *HSpace* with a *minHeight* threshold.
    ///
    /// - Parameter minHeight: The minHeight threshold.
    init(minHeight: CGFloat) {
        self.init(expand: true, height: minHeight)
    }

    /// Creates an *HSpace* with a *maxHeight*  threshold.
    ///
    /// - Parameter maxHeight: The maxHeight threshold.
    init(maxHeight: CGFloat) {
        self.init(expand: false, height: maxHeight)
    }

    /// Creates a *minHeight* threshold.
    ///
    /// - Parameter minHeight: The minHeight threshold.
    init(minHeight: () -> CGFloat) {
        self.init(minHeight: minHeight())
    }

    /// Creates a *maxHeight* threshold.
    ///
    /// - Parameter maxHeight: The maxHeight threshold.
    init(maxHeight: () -> CGFloat) {
        self.init(maxHeight: maxHeight())
    }

    /// A spacer with a *minHeight* or *maxHeight* frame.
    var body: some View {
        if expand {
            Spacer()
                .frame(minHeight: self.height)
        } else {
            Spacer()
                .frame(maxHeight: self.height)
        }
    }
}

/// *HSpace* previews.
struct HSpace_Previews: PreviewProvider {
    /// The group of views displayed as the preview.
    static var previews: some View {
        Group {
            HSpace(maxHeight: 64.0)
        }
    }
}

/// Creates space for the keyboard.
struct KeyboardSpace: ViewModifier {
    /// States the current height of the keyboard.
    @State var currentHeight: CGFloat = 0

    /// The inner `Space` structure.
    ///
    /// - Parameter content: Contains padding, edgesIgnoringSafeArea and onAppear.
    ///
    /// - Returns: Content view of the body.
    func body(content: Content) -> some View {
        content
            .padding(.bottom, currentHeight)
            .edgesIgnoringSafeArea(currentHeight == 0 ? Edge.Set() : .bottom)
            .onAppear(perform: subsribe)
    }

    /// Contains information if the keyboard will open up and uses keys
    /// to get the location and size from the userInfo dictionary.
    private let willOpen = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map {
            // swiftlint:disable force_cast
            $0.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            // swiftlint:enable force_cast
        }
        .map { $0.height }

    /// Contains information if the keyboard will hide.
    private let willHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in CGFloat.zero }

    /// Subscribes to merge,  print and assign the *willOpen* and *willHide* to the *currentHeight*.
    private func subsribe() {
        _ = Publishers.Merge(willOpen, willHide)
            .subscribe(on: RunLoop.main)
            .assign(to: \.currentHeight, on: self)
    }
}
