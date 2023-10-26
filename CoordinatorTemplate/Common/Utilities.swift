//
//  Utilities.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import Foundation
import UIKit

precedencegroup SelectivePrecedence {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
}

infix operator | : SelectivePrecedence

func isIPad() -> Bool {
    switch (UIScreen.main.traitCollection.horizontalSizeClass, UIScreen.main.traitCollection.verticalSizeClass) {
    case (.regular, .regular):
        return true
    default:
        return false
    }
}

func | (lhs: CGFloat, rhs: CGFloat) -> CGFloat {
    return isIPad() ? rhs : lhs
}

func * (lhs: Int, rhs: String) -> String {
    var repeatedString = ""
    for _ in 0..<lhs {
        repeatedString += rhs
    }
    return repeatedString
}
