//
//  Device+Extensions.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import UIKit

extension UIDevice {

    class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    class var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
}
