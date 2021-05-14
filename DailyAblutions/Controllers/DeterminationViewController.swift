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
        m_Mantras.append(Mantra.createMany(number: 5, title: "You have to keep things moving", text: "Have you checked your to do list?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Practice signing", text: "DAD/MOM, BRO/SIS, NEED/MUST, WANT, COOL, NOTHING, AUNT/UNCLE, SEE YOU LATER, HAVE, BOY/GIRL, LANGUAGE, PLACE, FOR, MEAN, FAMILY, CLASS"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Let software be your leisure", text: "What do you want to push to github today?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Get in touch with YOU", text: "Do you have a moment to breathe or meditate?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "You magnificent son of a bitch!", text: "Does the reuse hamper have things that can be washed?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Improve your organization", text: "What is your plan for getting more organized? Do you have a time scheduled to plan?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "You are a mail", text: "When are you sorting through the pile of mail?"))
        m_Mantras.append(Mantra.createMany(number: 2, title: "I should just write what I want", text: "What did I want to write here? I don't remember"))
        m_Mantras.append(Mantra.createMany(number: 2, title: "This is for you!", text: "This app is your organization tool. Use it to guide your future self! Also please take the time to improve this; the payoff is exponential!"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "You network good time", text: "What do you want to write to send to each ironhacker?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "You have a list of repetitive chores", text: "What are they and how will you schedule them?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "You like jazz!", text: "When are you doing the walmart returns?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Silence the voices", text: "All these notifications are achievable goals. Accomplish them and be rewarded"))
        m_Mantras.append(Mantra.createMany(number: 2, title: "Happy accidents", text: "Can i wr-te a misztuk?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "You date a pig!", text: "What are some date ideas for Chloe?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Make time for things", text: "Do you have time to add to-dos to your calendar?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Your network is your net worth", text: "What features do you want to add to your network database app?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Your pig is 480!!", text: "What features do you want to add to your flashcards app?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "I need to poop", text: "When are you cleaning the mice sheddings in the closet?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Get ahead", text: "Is there something you can get done right now?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Code activism into your environment", text: "When are you scheduling BLM posts for the family chat?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Arm yourself", text: "You need tools to support you in the hearing world - get some hearing aids! What is the next step?"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Angie drrrrrlllll", text: "Your sister needs a drill, so you can fix the towel rack"))
        m_Mantras.append(Mantra.createMany(number: 5, title: "Poopie pee", text: "WhEn aRE yO u MoWInG thA LAWn..."))
        
        m_NotificationManager = NotificationManager()
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Start() {
        m_NotificationManager.clearNotifications()
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
