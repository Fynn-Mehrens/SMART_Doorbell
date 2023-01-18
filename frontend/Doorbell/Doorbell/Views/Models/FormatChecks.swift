//
//  FormatChecks.swift
//  Doorbell
//
//  Created by Cora Bleier on 18.01.23.
//

import SwiftUI

/// Unused atm
func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}
