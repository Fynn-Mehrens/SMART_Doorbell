//
//  MediaWithPlaceholder.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import Foundation

// swiftlint:disable redundant_string_enum_value

/// Definition of the *MediaWithPlaceholder*.
struct MediaWithPlaceholder: Codable, Equatable {
    /// Black fallback.
    static let black = "R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs="
    /// Red fallback.
    static let red = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mO8I2LzHwAFLQItt3E1zAAAAABJRU5ErkJggg=="
    /// Default url string value.
    var url = ""
    /// Returns the information wether the red or black fallback should be used.
    var placeholder = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" ? red : black
    /// Select the image of the enum.
    var type: Kind = .image

    /// The relative media with placeholder that checks wether the placeholder,
    /// url and type are equal of the left hand and right hand side.
    ///
    /// - Parameters:
    ///   - lhs: Media with placeholder left hand side containing url, placeholder and type.
    ///   - rhs: Media with placeholder right hand side containing url, placeholder and type.
    ///
    /// - Returns: Returns a boolean value when the data is equal of the left hand and right hand side.
    static func == (lhs: MediaWithPlaceholder, rhs: MediaWithPlaceholder) -> Bool {
        lhs.url == rhs.url && lhs.placeholder == rhs.placeholder && lhs.type == lhs.type
    }

    /// Enum of either case image, video or gif.
    enum Kind: String, Codable {
        case image = "image"
        case gif = "gif"
        case video = "video"
    }
}

// swiftlint:enable redundant_string_enum_value
