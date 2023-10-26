//
//  Array+Extension.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import Foundation

extension Array {

    func isValid(_ index: Int) -> Bool {
        return (index >= 0 && index < count)
    }

}

extension Array where Element: Equatable {

    mutating func remove(at element: Element) {
        if let index = self.firstIndex(of: element) {
            remove(at: index)
        }
    }

    func arrayByRemovingDuplicates() -> Array {
        return reduce(into: []) { result, element in
            if !result.contains(element) {
                result.append(element)
            }
        }
    }
}

// Safe way to access items in array by index
extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
