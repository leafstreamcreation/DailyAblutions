//
//  NotificationManagerTests.swift
//  DailyAblutionsTests
//
//  Created by Derek Noble on 9/13/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import XCTest
import UserNotifications
@testable import DailyAblutions

class NotificationManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInits() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSchedule() throws {
        //USE XCTest Asynchronous expectations to test this.
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let mantras = [Mantra(id: 1, title: "Food", text: "Are you feeling full?"),
                       Mantra(id: 2, title: "Schedule", text: "Have you planned for today?"),
                       Mantra(id: 3, title: "ASL", text: "ASL Word: WHAT'S UP")]
        
        let calendar = Calendar.current
        //test notifications will begin firing immediately
        let start = Date()
        //test notifications will stop firing 1 hour after they start firing
        let end = calendar.date(byAdding: .hour, value: 1, to: start)!
        let interval = DateInterval(start: start, end: end)
        
        let manager = NotificationManager()
        manager.m_Permission = true
        manager.Schedule(notifications: mantras, over: interval.duration)
        
        let expectation = XCTestExpectation(description: "The contents of the requests match the test mantras, and are scheduled in the correct order.")
        print("Notifications starting at: \(calendar.component(.hour, from: start)) hours, \(calendar.component(.minute, from: start)) minutes")
        print("Notifications ending at: \(calendar.component(.hour, from: end)) hours, \(calendar.component(.minute, from: end)) minutes")
        center.getPendingNotificationRequests(completionHandler: {
            (requests : [UNNotificationRequest]) in
            XCTAssertEqual(mantras.count, requests.count)
            print("The test mantras and requests have equal counts.")
            
            for (index, request) in requests.enumerated() {
                let trigger = (request.trigger!) as! UNTimeIntervalNotificationTrigger
                let firingDate = trigger.nextTriggerDate()!
                print("Mantra \(index + 1) firing at: \(calendar.component(.hour, from: firingDate)) hours, \(calendar.component(.minute, from: firingDate)) minutes")
                XCTAssertEqual(mantras[index].text, request.content.body)
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
