//
//  CGFloat+Extension.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import UIKit

extension CGFloat {

    func roundedDown() -> CGFloat {
        return self.rounded(.down)
    }

    func roundedNearestOrEven() -> CGFloat {
        return self.rounded(.toNearestOrEven)
    }

}
