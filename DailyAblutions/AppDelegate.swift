//
//  AppDelegate.swift
//  DailyAblutions
//
//  Created by Derek Noble on 4/13/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import UIKit
import BackgroundTasks
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let START_TIME = 10


    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Override point for registering background tasks
        let registrationSuccess = BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.noblesoftware.DailyAblutions.daily_refresh", using: nil, launchHandler: { task in
            self.HandleAppRefresh(task: task as! BGAppRefreshTask)
        })
        if !registrationSuccess {
            print("Background identifier not permitted")
        }
        print("registered daily refresh")
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        BGTaskScheduler.shared.getPendingTaskRequests(completionHandler: { taskrequests in
            for request in taskrequests {
                print("Found a scheduled task: \(request.identifier)")
            }
            print("Total task requests: \(taskrequests.count)")
        })
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    func HandleAppRefresh(task: BGAppRefreshTask) {
        ScheduleNextRefresh()
        
        let operationQueue = OperationQueue()
        
        let operation = BlockOperation(block: {
            let mantras = [
                Mantra(id: 1, title: "Avoid trying to listen", text: "Hearies waste their breath"),
                Mantra(id: 2, title: "Compare yourself to nobody", text: "Do you know any other Deaf feeders?"),
                Mantra(id: 3, title: "You are defined by your choices", text: "Shape your environment to make better ones"),
                Mantra(id: 4, title: "You built this program", text: "Good job!"),
                Mantra(id: 5, title: "Self advocate", text: "You deserve space to recharge"),
                Mantra(id: 6, title: "Explore dominance", text: "Start sex. Tease her.\nTell her how fat she is"),
                Mantra(id: 7, title: "Ignore hearies", text: "They must reliably accomodate you"),
                Mantra(id: 8, title: "Pay yourself first", text: "How about browsing some Deaf media?"),
                Mantra(id: 9, title: "Your power is your own", text: "Nobody deserves it more than you"),
                Mantra(id: 10, title: "Practice signing", text: "GOOD (MORNING/AFTERNOON/NIGHT), DAD/MOM, BRO/SIS, WHAT'S UP?, TIME, SAME, NOTHING, AUNT/UNCLE, SEE YOU LATER, FOOD, LIKE"),
                Mantra(id: 11, title: "Sit gently on the couch", text: "Angie will thank you"),
                Mantra(id: 12, title: "You are enough", text: "Take a moment to reflect\non something you like\nabout yourself"),
                Mantra(id: 13, title: "Love yourself", text: "Believe in the me\nthat believes in you!"),
                Mantra(id: 14, title: "Set boundaries", text: "You owe yourself everything")
            ]
            let notificationManager = NotificationManager()
            
            let calendar = Calendar.current
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
            let tomorrowMorning = calendar.startOfDay(for: tomorrow)
            let notificationsBegin = calendar.date(byAdding: .hour, value: self.START_TIME, to: tomorrowMorning)!
            let notificationsEnd = calendar.date(byAdding: .hour, value: 14, to: notificationsBegin)!
            notificationManager.Schedule(notifications: mantras.shuffled(), over: DateInterval(start: notificationsBegin, end: notificationsEnd).duration)
        })
        
        task.expirationHandler = {
            operation.cancel()
        }
        
        operation.completionBlock = {
            task.setTaskCompleted(success: !operation.isCancelled)
        }
        operationQueue.addOperation(operation)
    }
    
    func ScheduleNextRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.noblesoftware.DailyAblutions.daily_refresh")
        
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
        let tomorrowMorning = calendar.startOfDay(for: tomorrow)
        
        request.earliestBeginDate = calendar.date(byAdding: .hour, value: START_TIME, to: tomorrowMorning)!
        
        do {
            try BGTaskScheduler.shared.submit(request)
            print("Next refresh scheduled")
        } catch {
            print("Could not schedule app refresh: \(error)")
        }
    }
}

