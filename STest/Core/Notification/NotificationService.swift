//
//  NotificationService.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class NotificationService: NSObject {
    class func postNotification(_ notification: Notification.Name, info: [String: Any]? = nil) {
        NotificationCenter.default.post(name: notification, object: nil, userInfo: info)
    }
}
