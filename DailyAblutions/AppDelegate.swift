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
            let notificationManager = NotificationManager()
            
            let calendar = Calendar.current
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
            let tomorrowMorning = calendar.startOfDay(for: tomorrow)
            let notificationsBegin = calendar.date(byAdding: .hour, value: self.START_TIME, to: tomorrowMorning)!
            let notificationsEnd = calendar.date(byAdding: .hour, value: 14, to: notificationsBegin)!
            let duration = DateInterval(start: notificationsBegin, end: notificationsEnd).duration
            
            var mantras = [[Mantra]]()
            
            mantras.append(Mantra.createMany(number: 2, title: "You are a Deaf feeder", text: "Why is it inappropriate for a hearie to comment on your hearing and speech?"))
            mantras.append(Mantra.createMany(number: 5, title: "You have to keep things moving", text: "Have you checked your to do list?"))
            mantras.append(Mantra.createMany(number: 5, title: "Practice signing", text: "DAD/MOM, BRO/SIS, NEED/MUST, WANT, COOL, NOTHING, AUNT/UNCLE, SEE YOU LATER, HAVE, BOY/GIRL, LANGUAGE, PLACE, FOR, MEAN, FAMILY, CLASS"))
            mantras.append(Mantra.createMany(number: 5, title: "Let software be your leisure", text: "What do you want to push to github today?"))
            mantras.append(Mantra.createMany(number: 5, title: "Finish taxes", text: "What is the next step to finishing Chloe's taxes?"))
            mantras.append(Mantra.createMany(number: 5, title: "Wall painting", text: "What is the next step finishing wall repairs?"))
            mantras.append(Mantra.createMany(number: 5, title: "Get in touch with YOU", text: "Do you have a moment to breathe or meditate?"))
            mantras.append(Mantra.createMany(number: 5, title: "You magnificent son of a bitch!", text: "Does the reuse hamper have things that can be washed?"))
            mantras.append(Mantra.createMany(number: 5, title: "Improve your organization", text: "What is your plan for getting more organized? Do you have a time scheduled to plan?"))
            mantras.append(Mantra.createMany(number: 5, title: "You are a mail", text: "When are you sorting through the pile of mail?"))
            mantras.append(Mantra.createMany(number: 2, title: "I should just write what I want", text: "What did I want to write here? I don't remember"))
            mantras.append(Mantra.createMany(number: 2, title: "This is for you!", text: "This app is your organization tool. Use it to guide your future self! Also please take the time to improve this; the payoff is exponential!"))
            mantras.append(Mantra.createMany(number: 5, title: "You are 30 now!", text: "When are you getting back to Barbara?"))
            mantras.append(Mantra.createMany(number: 5, title: "You network good time", text: "What do you want to write to send to each ironhacker?"))
            mantras.append(Mantra.createMany(number: 5, title: "You have a list of repetitive chores", text: "What are they and how will you schedule them?"))
            mantras.append(Mantra.createMany(number: 5, title: "You like jazz!", text: "When are you doing the walmart returns?"))
            mantras.append(Mantra.createMany(number: 5, title: "You love Chloe!", text: "When are you finding recipes for her birthday desserts?"))
            mantras.append(Mantra.createMany(number: 5, title: "Silence the voices", text: "All these notifications are achievable goals. Accomplish them and be rewarded"))
            mantras.append(Mantra.createMany(number: 2, title: "Happy accidents", text: "Can i wr-te a misztuk?"))
            mantras.append(Mantra.createMany(number: 5, title: "You date a pig!", text: "What are some date ideas for Chloe?"))
            mantras.append(Mantra.createMany(number: 5, title: "Make time for things", text: "Do you have time to add to-dos to your calendar?"))
            mantras.append(Mantra.createMany(number: 5, title: "Your network is your net worth", text: "What features do you want to add to your network database app?"))
            mantras.append(Mantra.createMany(number: 5, title: "Your pig is 480!!", text: "What features do you want to add to your flashcards app?"))
            mantras.append(Mantra.createMany(number: 5, title: "It's the final week of project 2", text: "What features do I want to add for this final week?"))
            mantras.append(Mantra.createMany(number: 5, title: "Just focus on the project!", text: "When are you going to shave Chloe's fupa next?"))
            mantras.append(Mantra.createMany(number: 5, title: "I need to poop", text: "When are you cleaning the mice sheddings in the closet?"))
            mantras.append(Mantra.createMany(number: 5, title: "Get ahead", text: "Is there something you can get done right now?"))
            mantras.append(Mantra.createMany(number: 5, title: "Your presence is important", text: "How will you curb your cannabis intake?"))
            mantras.append(Mantra.createMany(number: 5, title: "Code activism into your environment", text: "When are you scheduling BLM posts for the family chat?"))
            
            for mantra in mantras {
                notificationManager.Schedule(notifications: mantra, over: duration)
            }
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

