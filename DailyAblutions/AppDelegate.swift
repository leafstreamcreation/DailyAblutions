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
import UserNotifications

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
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1

        let operation = BlockOperation(block: {
            let mantras = [
                Mantra(id: 15, title: "✨Waiting for a pause is too nice✨", text: "And trying to listen robs you of your intelligence:\nIn what situations do you find yourself waiting and listening?"),
                Mantra(id: 16, title: "✨Compare yourself to nobody✨", text: "Do you know any other Deaf feeders?"),
                Mantra(id: 17, title: "✨You are defined by your choices✨", text: "What are your goals?\nIs there something in your environment that doesn't support them?"),
                Mantra(id: 18, title: "✨You built this program!✨", text: "Read every mantra; consider its value and answer the question each time:\nHow can I make this better?"),
                Mantra(id: 19, title: "✨Self advocate✨", text: "Take the time to be present.\nWhen I feel overwhelmed, what can I do to recenter myself?"),
                Mantra(id: 20, title: "✨Explore dominance✨", text: "Chloe's little side loves paternal discipline.\nHow can you use that to delight her?"),
                Mantra(id: 21, title: "✨Chloe is 470 pounds of faaaaat 🐷✨", text: "And she loves you unconditionally. She sees when you're overwhelmed;\nlet her help."),
                Mantra(id: 22, title: "✨Only do what needs to be done✨", text: "Anything more is a waste of time.\nWhen you hesitate to do or say something imperfectly ask:\nDoes it get the job done?"),
                Mantra(id: 23, title: "✨Keep things moving✨", text: "Plan each day. Pick a direction and swim.\nWhen you feel like taking a break, ask why."),
                Mantra(id: 24, title: "✨Practice signing✨", text: "GOOD (MORNING/AFTERNOON/NIGHT), DAD/MOM, BRO/SIS, WHAT'S UP?, TIME, SAME, NOTHING, AUNT/UNCLE, SEE YOU LATER, FOOD, LIKE, READY, REALLY, BOY/GIRL, LANGUAGE, PLACE, FOR, GOOD/BAD"),
                Mantra(id: 25, title: "✨Sit gently on the couch✨", text: "How will you be mindful of when you are sitting down?"),
                Mantra(id: 26, title: "✨Better coping mechanisms✨", text: "Cannabis and video games are poor coping mechanisms. When you feel like doing either ask:\nIs there a satisfying alternative?"),
                Mantra(id: 27, title: "✨You are enough✨", text: "Believe in the me\nthat believes in you!"),
                Mantra(id: 28, title: "✨Everything gets better after work starts✨", text: "If you haven't looked for work yet today:\nwhat would help to get it done?")
            ]
            let notificationManager = NotificationManager()
            
            let calendar = Calendar.current
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
            let tomorrowMorning = calendar.startOfDay(for: tomorrow)
            let notificationsBegin = calendar.date(byAdding: .hour, value: self.START_TIME, to: tomorrowMorning)!
            let notificationsEnd = calendar.date(byAdding: .hour, value: 14, to: notificationsBegin)!
            notificationManager.Schedule(notifications: mantras.shuffled(), over: DateInterval(start: notificationsBegin, end: notificationsEnd).duration)
            Utilities.debugNotification(id: "BackgroundUpdateSuccess", message: "Mantras scheduled in background.")
        })

        task.expirationHandler = {
            operation.cancel()
        }

        operation.completionBlock = {
            task.setTaskCompleted(success: !operation.isCancelled)
        }
        queue.addOperation(operation)
        
    }
    
    func ScheduleNextRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.noblesoftware.DailyAblutions.daily_refresh")
        
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
        let tomorrowMorning = calendar.startOfDay(for: tomorrow)
        
        request.earliestBeginDate = calendar.date(byAdding: .hour, value: START_TIME, to: tomorrowMorning)!
        
        do {
            try BGTaskScheduler.shared.submit(request)
            Utilities.debugNotification(id: "ScheduleRefresh", message: "Background refresh scheduled for after \(START_TIME)am tomorrow")
        } catch {
            print("Could not schedule app refresh: \(error.localizedDescription)")
        }
    }
}

