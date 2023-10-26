//
//  Int+Extension.swift.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import Foundation

extension Int {
    var convertToWord: String {
        let numberValue = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        guard let word = formatter.string(from: numberValue) else {
            return ""
        }
        return word
    }

    func convertToFloat() -> Float {
        return Float(self)
    }
}
