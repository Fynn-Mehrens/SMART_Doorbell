//
//  Localization.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

/// A *LocalizedStringKey* extension that grants access to the internal key.
extension LocalizedStringKey {
    /// The internal string key used for lookup.
    var stringKey: String {
        return "\(self)".components(separatedBy: "key: \"")
            .map { $0.components(separatedBy: "\",") }[1][0]
    }
}

/// A *LocalizedStringKey* extension that creates a fallback.
extension String {
    /// Function to fallback to the base language.
    ///
    /// - Parameter key: String key containing the value.
    ///
    /// - Returns: A fallback string key value.
    func fallbackLS(_ key: String) -> String {
        /// Fall back to base
        let value = NSLocalizedString(key, comment: "")
        if value != key || NSLocale.preferredLanguages.first == "base" {
            return value
        }

        guard
            let path = Bundle.main.path(forResource: "base", ofType: "lproj"),
            let bundle = Bundle(path: path)
        else { return value }
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }
}

/// A *LocalizedStringKey* extension that hashes the stringKey.
extension LocalizedStringKey: Hashable {
    /// Function to hash a LocalizedStringKey.
    ///
    /// - Parameter hasher: Maps an arbitrary sequence of bytes to a string key hash value.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.stringKey)
    }
}
