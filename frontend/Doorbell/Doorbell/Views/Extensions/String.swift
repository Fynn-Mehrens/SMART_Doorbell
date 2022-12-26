//
//  String.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import Foundation

/// A *String* extension to convert the first letter to a capital letter.
extension String {
    /// The first letter of the String will be converted to capital letter.
    func capitalizingFirstLetter() -> String {
        prefix(1).capitalized + dropFirst()
    }

    /// The first letter of the String will be converted to capital letter.
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
