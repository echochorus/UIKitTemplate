//
//  DateFormatterStyles.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import Foundation

enum DateFormatterStyle {
    case medium
    case long
    case longFullYear
    case shortTime12h
    case shortTime12hWithOutMeridiem
    case shortTime24h
    case meridiem
    case hour12h
    case hour24h

    func format() -> String {
        switch self {
        case .medium:
            return "MMMM dd, yyyy"
        case .long:
            return "MM/dd/yy h:mm a zzz"
        case .longFullYear:
            return "MM/dd/yyyy h:mm a"
        case .shortTime12h:
            return "h:mm a"
        case .shortTime12hWithOutMeridiem:
            return "h:mm"
        case .shortTime24h:
            return "H:mm"
        case .meridiem:
            return "a"
        case .hour12h:
            return "h a"
        case .hour24h:
            return "H"
        }
    }
}
