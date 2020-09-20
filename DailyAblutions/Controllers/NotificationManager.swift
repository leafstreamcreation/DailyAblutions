//
//  NotificationManager.swift
//  DailyAblutions
//
//  Created by Derek Noble on 9/13/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import Foundation
import UserNotifications
import GameplayKit

class NotificationManager: NSObject {
    
    //MARK: Fields
    internal var m_Permission: Bool
    internal var m_Center: UNUserNotificationCenter
    
    //MARK: Initializers
    override init() {
        //ask for permission
        m_Permission = false
        m_Center = UNUserNotificationCenter.current()
        super.init()
        m_Center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {
            granted, error in
            if let error = error {
                print(error.localizedDescription)
            }
            self.m_Permission = granted
        })
    }
    
    //MARK: Methods
    func Schedule(notifications: [Notificationable], over: TimeInterval) {
        //decide when each notification will be scheduled
        //how does that work?
        //let's start with something easy and then refine it over time
        //divide the time between START and STOP into intervals
        //   save the width of the interval
        //use current time instead of START if current time is after START
        //if current time is after STOP, don't schedule anything
        
        
        
        //for each notification in the list,
        //   set the notification trigger
        //   create a request
        //   get the center add the request, and handle any errors
        print("Have permission: \(m_Permission)")
        if m_Permission && !notifications.isEmpty && !over.isLessThanOrEqualTo(0.0) {
            
            let notificationInterval = over / Double(notifications.count)
            
            let rng = GKRandomDistribution(randomSource: GKMersenneTwisterRandomSource(), lowestValue: 0, highestValue: Int(notificationInterval))
            
            var scheduleHead = 0.0
            for (index, notification) in notifications.enumerated() {
                let randomInterval = Double(rng.nextUniform())
                debugPrint("Random interval: \(randomInterval)")
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: scheduleHead + Double(randomInterval), repeats: false)
                let request = UNNotificationRequest(identifier: "Mantra \(index)", content: notification.notificationContent, trigger: trigger)
                m_Center.add(request, withCompletionHandler: {
                    error in
                    if error != nil {
                        print(error!)
                    }
                    else {
                        print("Added Mantra \(index)")
                    }
                })
                scheduleHead += notificationInterval
            }
        }
        
    }
}

protocol Notificationable {
    var notificationContent: UNMutableNotificationContent { get }
}
