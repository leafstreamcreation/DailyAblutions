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
            Mantra(id: 1, title: "Social Scripts", text: "Throw a topic out to start a conversation"),
            Mantra(id: 2, title: "Identity", text: "Center your Deafness and your Feedism"),
            Mantra(id: 3, title: "Persuasion", text: "Shape your environment to shape your behavior"),
            Mantra(id: 4, title: "Projects", text: "Admire the app you built!"),
            Mantra(id: 5, title: "Persuasion", text: "Keep your wits about you. Don't smoke anymore"),
            Mantra(id: 6, title: "Dominance", text: "Be the one to start sex"),
            Mantra(id: 7, title: "Determination", text: "I love you. Your past thanks your present"),
            Mantra(id: 8, title: "Dominance", text: "Interrupt Chloe when she is distracted"),
            Mantra(id: 9, title: "Dominance", text: "Find work to fix your sadness"),
            Mantra(id: 10, title: "ASL practice", text: "Sign these: GOOD (MORNING/AFTERNOON/NIGHT), DAD/MOM, BRO/SIS"),
            Mantra(id: 11, title: "Social Scripts", text: "Engage with Kay. Ask her to speak up"),
            Mantra(id: 12, title: "Determination", text: "You are enough"),
            Mantra(id: 13, title: "Determination", text: "Check your to-do list"),
            Mantra(id: 14, title: "Social Scripts", text: "Interrupt people. Your words are important")
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
