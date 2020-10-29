//
//  Utilities.swift
//  DailyAblutions
//
//  Created by Derek Noble on 10/24/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import Foundation
import UserNotifications

class Utilities {
    
    
    public static func debugNotification(id: String, message: String) {
        let debugContent = UNMutableNotificationContent()
        debugContent.title = NSString.localizedUserNotificationString(forKey: "Debug", arguments: nil)
        debugContent.body = NSString.localizedUserNotificationString(forKey: message, arguments: nil)
        debugContent.sound = UNNotificationSound.default
        let notificationRequest = UNNotificationRequest(identifier: "Debug - \(id)", content: debugContent, trigger: nil)
        UNUserNotificationCenter.current().add(notificationRequest, withCompletionHandler: {
            error in
            if let failure = error {
                print(failure.localizedDescription)
            }
        })
    }
}
