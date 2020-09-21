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
            Mantra(id: 1, title: "Self advocate", text: "Express yourself without thinking"),
            Mantra(id: 2, title: "Be alert", text: "Anticipate problems from others and respond"),
            Mantra(id: 3, title: "Build your best world", text: "Shape your environment to shape your behavior"),
            Mantra(id: 4, title: "Appreciate life", text: "You built this app on your own"),
            Mantra(id: 5, title: "Self advocate", text: "You deserve space to recharge"),
            Mantra(id: 6, title: "Be dominant", text: "Start sex. Discipline her. Tease her"),
            Mantra(id: 7, title: "Appreciate life", text: "Reflect on something amazing that happened"),
            Mantra(id: 8, title: "Communicate", text: "If you're having trouble communicating, say so"),
            Mantra(id: 9, title: "Be determined", text: "Every task is an investment in happiness"),
            Mantra(id: 10, title: "Be Deaf", text: "GOOD (MORNING/AFTERNOON/NIGHT), DAD/MOM, BRO/SIS"),
            Mantra(id: 11, title: "Forge bonds", text: "Kay and Angie are family. Ask them to speak up"),
            Mantra(id: 12, title: "Be determined", text: "You are enough"),
            Mantra(id: 13, title: "Appreciate life", text: "Your girlfriend is getting extremely fat for you"),
            Mantra(id: 14, title: "Communicate", text: "Interrupt people. Your words are important")
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
