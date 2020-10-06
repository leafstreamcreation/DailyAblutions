//
//  AppDelegate.swift
//  DailyAblutions
//
//  Created by Derek Noble on 4/13/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import UIKit
import BackgroundTasks

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let START_TIME = 10


    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Override point for registering background tasks
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.noblesoftware.DailyAblutions.daily_refresh", using: nil, launchHandler: { task in
            self.HandleAppRefresh(task: task as! BGAppRefreshTask)
        })
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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
        
        //
    }
    
    func ScheduleNextRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.noblesoftware.DailyAblutions.daily_refresh")
        
        let calendar = Calendar.current
        var startTomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
        startTomorrow = calendar.startOfDay(for: startTomorrow)
        
        request.earliestBeginDate = calendar.date(byAdding: .hour, value: START_TIME, to: startTomorrow)!
        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Could not schedule app refresh: \(error)")
        }
    }
}

