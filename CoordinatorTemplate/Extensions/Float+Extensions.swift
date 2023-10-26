//
//  Float+Extensions.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import Foundation

extension Float {

    var roundedInt: Int {
        return Int(self.rounded())
    }

    // https://stackoverflow.com/questions/29560743/swift-remove-trailing-zeros-from-double/29560976
    func byRemovingZerosFromEnd() -> String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }

    // From Accuswift Rounding Logic
    func rounded(to places: Int = 0) -> Float {
        let factor = pow(10, Double(places))
        var rounded = Float((Double(self) * factor).rounded() / factor)
        // because swift will round -0.4 to -0 (yes, the actual number), we have to include this workaround
        if abs(rounded) == 0 {
            rounded = 0
        }
        return rounded
    }

    func nearestTo(places: Float) -> Float {
        let remainder = self.remainder(dividingBy: places)
        let half = places / 2
        if remainder < half {
            return self - remainder
        } else {
            return self + (places - remainder)
        }
    }
}
