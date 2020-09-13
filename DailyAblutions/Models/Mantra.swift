//
//  Mantra.swift
//  DailyAblutions
//
//  Created by Derek Noble on 6/5/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import Foundation
import UserNotifications

class Mantra: Hashable, NSCoding, Identifiable, CustomStringConvertible, Notificationable {
    
    class PropertyKeys {
        static let ID: String = CodingKeys.m_Id.rawValue
        static let TEXT: String = CodingKeys.m_Text.rawValue
    }
    
    //MARK: Fields
    internal var m_Id: UInt
    internal var m_Text: String
    
    var description: String {
        return "\nId: \(m_Id)\nText: \(m_Text)"
    }
    
   var notificationContent: UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Mantra \(m_Id)", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: m_Text, arguments: nil)
        return content
    }
    
    var text: String {
        let copy = m_Text
        return copy
    }
    
    var id: UInt {
        let copy = m_Id
        return copy
    }
    
    
    //MARK: Types
    enum CodingKeys: String, CodingKey {
        case m_Id = "id"
        case m_Text = "text"
    }
    
    
    //MARK: Initializers
    init() {
        m_Text = ""
        m_Id = 0
    }
    
    init(id: UInt, text: String) {
        m_Id = id
        m_Text = text
    }
    
    
    //MARK: Functions
    
    func ChangeText(to text: String) {
        m_Text = text
    }
    
    
    //MARK: Hashable
    static func == (lhs: Mantra, rhs: Mantra) -> Bool {
        return lhs.m_Id == rhs.m_Id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(m_Id)
        hasher.combine(m_Text)
    }
    
    
    //MARK: NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(m_Id, forKey: CodingKeys.m_Id.rawValue)
        coder.encode(m_Text, forKey: CodingKeys.m_Text.rawValue)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
}
