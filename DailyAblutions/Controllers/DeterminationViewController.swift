//
//  DeterminationViewController.swift
//  DailyAblutions
//
//  Created by Derek Noble on 9/15/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import Foundation
import SwiftUI

class DeterminationViewController<Content> : UIHostingController<Content> where Content : View {
    
    internal var m_Mantras : [Mantra]
    internal var m_NotificationManager : NotificationManager
    
    override init(rootView: Content) {
        m_Mantras = [
            Mantra(id: 1, title: "Avoid trying to listen", text: "The hearies waste their breath"),
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
        m_NotificationManager = NotificationManager()
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Start() {
        m_NotificationManager.Schedule(notifications: m_Mantras.shuffled(), over: GenerateNotificationInterval())
        print("Schedule complete")
    }
    
    internal func GenerateNotificationInterval() -> TimeInterval {
        let calendar = Calendar.current
        let now = Date()
        let sevenMinutesFromNow = calendar.date(byAdding: .hour, value: 14, to: now)!
        return DateInterval(start: now, end: sevenMinutesFromNow).duration
    }
}
