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
        print("Schedule test setup.")
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let mantras = [Mantra(id: 1, text: "Are you feeling full?"),
                       Mantra(id: 2, text: "Have you planned for today?"),
                       Mantra(id: 3, text: "ASL Word: WHAT'S UP")]
        
        let calendar = Calendar.current
        let start = Date()
        let end = calendar.date(byAdding: .hour, value: 14, to: start)!
        let interval = DateInterval(start: start, end: end)
        
        let manager = NotificationManager()
        manager.Schedule(notifications: mantras, over: interval.duration)
        
        center.getPendingNotificationRequests(completionHandler: {
            (requests : [UNNotificationRequest]) in
            print("Now the real test begins.")
            XCTAssertEqual(mantras.count, requests.count)
            print("The test mantras and requests have equal counts.")
            
            for (index, request) in requests.enumerated() {
                //this assumes that mantras are
                XCTAssertEqual(mantras[index].text, request.content.body)
            }
            print("The contents of the requests match the test mantras, and are scheduled in the correct order.")
            print("Test Passed.")
            
            //to do: test that the notifications are scheduled at the right time
        })
        print("End of Test.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
