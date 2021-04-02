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
    
    internal var m_Mantras : [[Mantra]]
    internal var m_NotificationManager : NotificationManager
    
    override init(rootView: Content) {
        m_Mantras = [[Mantra]]()
        m_Mantras.append(Mantra.createMany(number: 2, title: "You are a Deaf feeder", text: "Why is it inappropriate for a hearie to comment on your hearing and speech?"))
        m_Mantras.append(Mantra.createMany(number: 7, title: "You have to keep things moving", text: "Have you checked your to do list?"))
        m_Mantras.append(Mantra.createMany(number: 2, title: "Practice signing", text: "DAD/MOM, BRO/SIS, NEED/MUST, WANT, COOL, NOTHING, AUNT/UNCLE, SEE YOU LATER, HAVE, BOY/GIRL, LANGUAGE, PLACE, FOR, MEAN"))
        m_Mantras.append(Mantra.createMany(number: 7, title: "Let software be your leisure", text: "What do you want to push to github today?"))
        m_Mantras.append(Mantra.createMany(number: 2, title: "Feed yourself", text: "When are you going to finish meal prepping?"))
        m_Mantras.append(Mantra.createMany(number: 7, title: "Finish taxes", text: "What is the next step to finishing taxes?"))
        m_Mantras.append(Mantra.createMany(number: 7, title: "Car registration", text: "What is the next step taking care of the car?"))
        m_Mantras.append(Mantra.createMany(number: 7, title: "Wall painting", text: "What is the next step finishing wall repairs?"))
        m_Mantras.append(Mantra.createMany(number: 7, title: "Network", text: "What are the next steps to grow my network?"))
        m_NotificationManager = NotificationManager()
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Start() {
        for mantra in m_Mantras {
            m_NotificationManager.Schedule(notifications: mantra, over: GenerateNotificationInterval())
        }
        print("Schedule complete")
    }

    internal func GenerateNotificationInterval() -> TimeInterval {
        let calendar = Calendar.current
        let now = Date()
        let dateFromNow = calendar.date(byAdding: .hour, value: 14, to: now)!
        return DateInterval(start: now, end: dateFromNow).duration
    }
}
