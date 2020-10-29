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
            Mantra(id: 1, title: "Waiting for a pause is too nice.", text: "And trying to listen robs you of your intelligence:\nIn what situations do you find yourself waiting and listening?"),
            Mantra(id: 2, title: "Compare yourself to nobody", text: "Do you know any other Deaf feeders?"),
            Mantra(id: 3, title: "You are defined by your choices", text: "What are your goals?\nIs there something in your environment that doesn't support them?"),
            Mantra(id: 4, title: "You built this program!", text: "Read every mantra; consider its value and answer the question each time:\nHow can I make this better?"),
            Mantra(id: 5, title: "Self advocate", text: "Take the time to be present.\nWhen I feel overwhelmed, what can I do to recenter myself?"),
            Mantra(id: 6, title: "Explore dominance", text: "Chloe's little side loves paternal discipline.\nHow can you use that to delight her?"),
            Mantra(id: 7, title: "Chloe is 470 pounds of faaaaat 🐷", text: "And she loves you unconditionally. She sees when you're overwhelmed;\nlet her help."),
            Mantra(id: 8, title: "Only do what needs to be done", text: "Anything more is a waste of time.\nWhen you hesitate to do or say something imperfectly ask:\nDoes it get the job done?"),
            Mantra(id: 9, title: "Keep things moving", text: "Plan each day. Pick a direction and swim.\nWhen you feel like taking a break, ask why."),
            Mantra(id: 10, title: "Practice signing", text: "GOOD (MORNING/AFTERNOON/NIGHT), DAD/MOM, BRO/SIS, WHAT'S UP?, TIME, SAME, NOTHING, AUNT/UNCLE, SEE YOU LATER, FOOD, LIKE, READY, REALLY, BOY/GIRL, LANGUAGE, PLACE, FOR, GOOD/BAD"),
            Mantra(id: 11, title: "Sit gently on the couch", text: "How will you be mindful of when you are sitting down?"),
            Mantra(id: 12, title: "Better coping mechanisms", text: "Cannabis and video games are poor coping mechanisms. When you feel like doing either ask:\nIs there a satisfying alternative?"),
            Mantra(id: 13, title: "You are enough", text: "Believe in the me\nthat believes in you!"),
            Mantra(id: 14, title: "Everything gets better after work starts", text: "If you haven't looked for work yet today:\nwhat would help to get it done?")
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
        let dateFromNow = calendar.date(byAdding: .hour, value: 14, to: now)!
        return DateInterval(start: now, end: dateFromNow).duration
    }
}
