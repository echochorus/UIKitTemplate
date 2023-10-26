//
//  AppConstants.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import UIKit

struct AppConstants {

    struct QueueName {
        static let defaultQueue = "com.mpathmobile.CoordinatorTemplate.defaultQueue.dispatchGroup"
    }

    struct AnimationKey {
        static let rotation = "rotation"
    }

    struct NotificationsDetailViewInsets {
        static let horizontalDefault: CGFloat = 20.0 | 30.0
    }

    struct ScreenDimensions {
        static let width = UIScreen.main.bounds.size.width
        static let height = UIScreen.main.bounds.size.height
    }

    struct DateFormats {
        static let endpointDateFormat = "MM/dd/yy hh:mm a zzz"
        static let displayDateFormat = "hh:mm a z, EEE, MMM dd"
    }
}
