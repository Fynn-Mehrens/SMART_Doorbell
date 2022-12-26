//
//  Colors.swift
//  Doorbell
//
//  Created by Cora Bleier on 26.12.22.
//

import SwiftUI

/// Color extension to add support for the *UIKit System Colors*.
extension Color {
    /// White or black dependent on color scheme.
    ///
    /// Any: white
    ///
    /// Light: white
    ///
    /// Dark: black
    static var primal: Color {
        return Color("PrimalColor")
    }

    /// Black or white dependent on color scheme.
    ///
    /// Any: black
    ///
    /// Light: black
    ///
    /// Dark: white
    static var invertedPrimal: Color {
        return Color("InvertedPrimalColor")
    }

    /// The color of the dismiss button foreground.
    static var dismissForeground: Color {
        return Color("DismissForegroundColor")
    }

    /// The color of the dismiss button background.
    static var dismissBackground: Color {
        return Color("DismissBackgroundColor")
    }

    /// The color for text labels that contain primary content.
    static var label: Color {
        return Color(UIColor.label)
    }

    /// The color for text labels that contain secondary content.
    static var secondaryLabel: Color {
        return Color(UIColor.secondaryLabel)
    }

    /// The color for text labels that contain tertiary content.
    static var tertiaryLabel: Color {
        return Color(UIColor.tertiaryLabel)
    }

    /// The color for text labels that contain quaternary content.
    static var quaternaryLabel: Color {
        return Color(UIColor.quaternaryLabel)
    }

    /// An overlay fill color for thin and small shapes.
    ///
    /// Use system fill colors for items situated on top of an existing background color.
    /// System fill colors incorporate transparency to allow the background color to show through.
    ///
    /// Use this color to fill thin or small shapes, such as the track of a slider.
    static var systemFill: Color {
        return Color(UIColor.systemFill)
    }

    /// An overlay fill color for medium-size shapes.
    ///
    /// Use system fill colors for items situated on top of an existing background color.
    /// System fill colors incorporate transparency to allow the background color to show through.
    ///
    /// Use this color to fill medium-size shapes, such as the background of a switch.
    static var secondarySystemFill: Color {
        return Color(UIColor.secondarySystemFill)
    }

    /// An overlay fill color for large shapes.
    ///
    /// Use system fill colors for items situated on top of an existing background color.
    /// System fill colors incorporate transparency to allow the background color to show through.
    ///
    /// Use this color to fill large shapes, such as input fields, search bars, or buttons.
    static var tertiarySystemFill: Color {
        return Color(UIColor.tertiarySystemFill)
    }

    /// An overlay fill color for large areas that contain complex content.
    ///
    /// Use system fill colors for items situated on top of an existing background color.
    /// System fill colors incorporate transparency to allow the background color to show through.
    ///
    /// Use this color to fill large areas that contain complex content, such as an expanded table cell.
    static var quaternarySystemFill: Color {
        return Color(UIColor.quaternarySystemFill)
    }

    /// The color for placeholder text in controls or text views.
    static var placeholderText: Color {
        return Color(UIColor.placeholderText)
    }

    /// The color for the main background of your interface.
    ///
    /// Use this color for standard table views and designs that have a white primary background in a light environment.
    static var systemBackground: Color {
        return Color(UIColor.systemBackground)
    }

    /// The color for content layered on top of the main background.
    ///
    /// Use this color for standard table views and designs that have a white primary background in a light environment.
    static var secondarySystemBackground: Color {
        return Color(UIColor.secondarySystemBackground)
    }

    /// The color for content layered on top of secondary backgrounds.
    ///
    /// Use this color for standard table views and designs that have a white primary background in a light environment.
    static var tertiarySystemBackground: Color {
        return Color(UIColor.tertiarySystemBackground)
    }

    /// The color for the main background of your grouped interface.
    ///
    /// Use this color for grouped content, including table views and platter-based designs.
    ///
    static var systemGroupedBackground: Color {
        return Color(UIColor.systemGroupedBackground)
    }

    /// The color for content layered on top of the main background of your grouped interface.
    ///
    /// Use this color for grouped content, including table views and platter-based designs.
    static var secondarySystemGroupedBackground: Color {
        return Color(UIColor.secondarySystemGroupedBackground)
    }

    /// The color for content layered on top of secondary backgrounds of your grouped interface.
    ///
    /// Use this color for grouped content, including table views and platter-based designs.
    static var tertiarySystemGroupedBackground: Color {
        return Color(UIColor.tertiarySystemGroupedBackground)
    }

    /// The color for thin borders or divider lines that allows some underlying content to be visible.
    ///
    /// This color may be partially transparent to allow the underlying content to show through.
    /// It adapts to the underlying trait environment.
    static var separator: Color {
        return Color(UIColor.separator)
    }

    /// The color for borders or divider lines that hides any underlying content.
    ///
    /// This color is always opaque. It adapts to the underlying trait environment.
    static var opaqueSeparator: Color {
        return Color(UIColor.opaqueSeparator)
    }

    /// The specified color for links.
    static var link: Color {
        return Color(UIColor.link)
    }

    /// Turquoise
    static var turquoise: Color {
        return Color("TurquoiseColor")
    }

    /// Red
    static var systemRed: Color {
        return Color(UIColor.systemRed)
    }

    /// Blue
    static var systemBlue: Color {
        return Color(UIColor.systemBlue)
    }

    /// Pink
    static var systemPink: Color {
        return Color(UIColor.systemPink)
    }

    /// Teal
    static var systemTeal: Color {
        return Color(UIColor.systemTeal)
    }

    /// Green
    static var systemGreen: Color {
        return Color(UIColor.systemGreen)
    }

    /// Indigo
    static var systemIndigo: Color {
        return Color(UIColor.systemIndigo)
    }

    /// Orange
    static var systemOrange: Color {
        return Color(UIColor.systemOrange)
    }

    /// Purple
    static var systemPurple: Color {
        return Color(UIColor.systemPurple)
    }

    /// Yellow
    static var systemYellow: Color {
        return Color(UIColor.systemYellow)
    }

    /// Gray
    static var systemGray: Color {
        return Color(UIColor.systemGray)
    }

    /// Gray (2)
    static var systemGray2: Color {
        return Color(UIColor.systemGray2)
    }

    /// Gray (3)
    static var systemGray3: Color {
        return Color(UIColor.systemGray3)
    }

    /// Gray (4)
    static var systemGray4: Color {
        return Color(UIColor.systemGray4)
    }

    /// Gray (5)
    static var systemGray5: Color {
        return Color(UIColor.systemGray5)
    }

    /// Gray (6)
    static var systemGray6: Color {
        return Color(UIColor.systemGray6)
    }
}
