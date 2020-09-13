//
//  NotificationManager.swift
//  DailyAblutions
//
//  Created by Derek Noble on 9/13/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject {
    
    //MARK: Macros
    static internal let START = 10
    static internal let STOP = 24
    
    //MARK: Fields
    internal var m_Schedule: [Notificationable]?
    
    //MARK: Initializers
    
    //MARK: Methods
    func Schedule(notifications: [Notificationable]) {
        
    }
}

protocol Notificationable {
    var notificationContent: UNMutableNotificationContent { get }
}
