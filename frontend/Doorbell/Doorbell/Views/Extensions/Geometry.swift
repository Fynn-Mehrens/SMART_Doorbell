//
//  Geometry.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import Foundation
import Combine
import SwiftUI

/// Relative length to a given width operator.
infix operator %-

/// Returns the relative length to the given view container geometry representation object
/// width for the given percentage on the left-hand side.
///
/// - Parameters:
///   - lhs: The relative view width percentage.
///   - rhs: A proxy for access to the size and coordinate space of a container view.
///
/// - Returns: Calculated relative width of the provided view geometry representation.
func %- (lhs: Double, rhs: GeometryProxy) -> CGFloat {
    rhs.size.width * (CGFloat(lhs) / 100)
}

/// Returns the relative length to the given geometry representation tuple width for the given
/// percentage on the left-hand side.
///
/// - Parameters:
///   - lhs: The relative width percentage.
///   - rhs: A tuple representing some arbitrary size consisting of width and height.
///
/// - Returns: Calculated relative width of the provided tuple geometry representation.
func %- (lhs: Double, rhs: (width: CGFloat, height: CGFloat)) -> CGFloat {
    rhs.width * (CGFloat(lhs) / 100)
}

/// Relative length to a given height operator.
infix operator %|

/// Returns the relative length to the given view container geometry representation object
/// height for the given percentage on the left-hand side.
///
/// - Parameters:
///   - lhs: The relative view height percentage.
///   - rhs: A proxy for access to the size and coordinate space of a container view.
///
/// - Returns: Calculated relative height of the provided view geometry representation.
func %| (lhs: Double, rhs: GeometryProxy) -> CGFloat {
    rhs.size.height * (CGFloat(lhs) / 100)
}

/// Returns the relative length to the given geometry representation tuple height for the given
/// percentage on the left-hand side.
///
/// - Parameters:
///   - lhs: The relative height percentage.
///   - rhs: A tuple representing some arbitrary size consisting of width and height.
///
/// - Returns: Calculated relative height of the provided tuple geometry representation.
func %| (lhs: Double, rhs: (width: CGFloat, height: CGFloat)) -> CGFloat {
    rhs.height * (CGFloat(lhs) / 100)
}

/// An environment key providing the current devices width and height as a tuple.
struct DeviceGeometryKey: EnvironmentKey {
    /// Returns a tuple representing the devices current width and height.
    static var defaultValue: (width: CGFloat, height: CGFloat) {
        (UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
    }
}

/// Extension of the *EnvironmentValues* struct to add the current devices size using *DeviceGeometryKey* type.
extension EnvironmentValues {
    /// Returns the current devices size using the`DeviceGeometryKey` type.
    var deviceGeometry: (width: CGFloat, height: CGFloat) {
        self[DeviceGeometryKey.self]
    }
}

/// Enum defining the sizes of all current iOS and iPadOS devices.
enum DeviceSizeClass {
    /// iPad, iPad Air, iPad Mini, iPad Pro
    case ultraLarge
    /// 12 Pro Max,
    case extraLarge
    /// 11 Pro Max, Xs Max, 12, 11, Xr
    case large
    /// 12 Pro, 11 Pro, Xs, X, 12 Mini
    case medium
    /// 8+, 7+, 6s+, 6+
    case small
    /// 8, 7, 6s, 6, SE 2
    case extraSmall

    /// Returns the screen size of the current *DeviceSizeClass*.
    var size: (width: CGFloat, height: CGFloat) {
        switch self {
        case .extraSmall:
            return (375, 667)
        case .small:
            return (414, 736)
        case .medium:
            return (375, 812)
        case .large:
            return (414, 896)
        case .extraLarge:
            return (428, 926)
        default:
            return (UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        }
    }

    /// Returns the device class for the current screen size.
    static var current: DeviceSizeClass {
        switch (UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height) {
        case (375, 667):
            return .extraSmall
        case (414, 736):
            return .small
        case (375, 812):
            return .medium
        case (414, 896):
            return .large
        case (428, 926):
            return .extraLarge
        default:
            return .ultraLarge
        }
    }

    /// Rasterizes the rasterization level of the current size class.
    var rasterization: Int {
        switch self {
        case .ultraLarge, .large, .medium:
            return 3
        default:
            return 2
        }
    }
}

/// An environment key providing the current devices size class.
struct DeviceSizeClassKey: EnvironmentKey {
    /// Returns the current devices size class.
    static var defaultValue: DeviceSizeClass {
        DeviceSizeClass.current
    }
}

/// Extension of the *EnvironmentValues* struct to add the current device size class using *DeviceSizeClassKey* type.
extension EnvironmentValues {
    /// Returns the current devices size class using the `DeviceSizeClassKey` type.
    var deviceSizeClass: DeviceSizeClass {
        self[DeviceSizeClassKey.self]
    }
}

/// Represents the current devices orientation.
final class DeviceOrientation: ObservableObject {
    /// An orientation change broadcast for downstream subscribers.
    let objectWillChange = PassthroughSubject<UIDeviceOrientation, Never>()

    /// The current devices orientation or *.unknown*.
    private(set) var orientation: UIDeviceOrientation = UIDeviceOrientation.unknown {
        willSet {
            objectWillChange.send(orientation)
        }
    }

    /// Returns whether the current device is in landscape mode.
    ///
    /// - Warning: Testing of *.faceUp* and *.faceDown* is not complete.
    public var landscape: Bool {
        orientation == .landscapeLeft || orientation == .landscapeRight
            || orientation == .faceUp || orientation == .faceDown
    }

    /// Initializes the orientation event broadcast, maps the values and assigns the result to
    /// the *orientation* property.
    init() {
        _ = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .map { _ in UIDevice.current.orientation }
            .subscribe(on: RunLoop.main)
            .assign(to: \.orientation, on: self)
    }
}

/// Represents the keyboards current state and size.
final class KeyboardGeometry: ObservableObject {
    /// A visibility change broadcast for downstream subscribers.
    let objectWillChange = PassthroughSubject<(CGFloat, CGFloat), Never>()

    /// Returns the keyboards current size as a tuple with width and height.
    private(set) var size: (width: CGFloat, height: CGFloat) = (0, 0) {
        willSet {
            objectWillChange.send(size)
        }
    }

    /// Returns wether or not the keyboard is open.
    public var open: Bool {
        size.height > 0
    }

    /// Returns wether the keyboard will open up and uses keys to get the location and size
    /// from the *userInfo* dictionary.
    private let willOpen = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map {
            // swiftlint:disable force_cast
            $0.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            // swiftlint:enable force_cast
        }
        .map { (width: $0.width, height: $0.height) }

    /// Returns wether the keyboard will hide.
    private let willHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in (width: CGFloat.zero, height: CGFloat.zero) }

    /// Initializes the broadcast merge of *willOpen* and *willHide* and assigns the result
    /// to the current size.
    init() {
        _ = Publishers.Merge(willOpen, willHide)
            .subscribe(on: RunLoop.main)
            .assign(to: \.size, on: self)
    }
}

/// Extension of the *View* to compute a frame containing the width, height and allignment.
extension View {
    /// Computes a frame containing width, height and allignment.
    ///
    /// - Parameters:
    ///   - alignment: Takes width and height of type CGFloat.
    ///   - computed: Computes the alignment.
    ///
    /// - Returns: The computed frame.
    func frame(alignment: Alignment, size computed: () -> (width: CGFloat, height: CGFloat)) -> some View {
        let size = computed()
        return self.frame(width: size.width, height: size.height, alignment: alignment)
    }

    /// Creates padding for the computed edges of a rectangle.
    ///
    /// - Parameters:
    ///   - edges: Indicates the edges of a rectangle.
    ///   - computed:Computes the edges of type float.
    ///
    /// - Returns: The edges padding of the view.
    func padding(_ edges: Edge.Set = .all, _ computed: () -> CGFloat) -> some View {
        return self.padding(edges, computed())
    }

    /// Computes the font of the view.
    ///
    /// - Parameter computed: Computes the font.
    ///
    /// - Returns: View of the computed font.
    func font(_ computed: () -> Font?) -> some View {
        return self.font(computed())
    }
}
