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
        static let ID: String = CodingKeys.id.rawValue
        static let TITLE: String = CodingKeys.title.rawValue
        static let TEXT: String = CodingKeys.text.rawValue
    }
    
    //MARK: Fields
    internal var m_Id: UInt
    internal var m_Title: String
    internal var m_Text: String
    
    var description: String {
        return "\nId: \(m_Id)\nTitle: \(m_Title)\nText: \(m_Text)"
    }
    
   var notificationContent: UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: m_Title, arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: m_Text, arguments: nil)
        content.sound = UNNotificationSound.default
        return content
    }
    
    var id: UInt {
        let copy = m_Id
        return copy
    }
    
    var title: String {
        let copy = m_Title
        return copy
    }
    
    var text: String {
        let copy = m_Text
        return copy
    }
    
    
    //MARK: Types
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case text = "text"
    }
    
    
    //MARK: Initializers
    init() {
        m_Id = 0
        m_Title = ""
        m_Text = ""
    }
    
    init(id: UInt, title: String, text: String) {
        m_Id = id
        m_Title = title
        m_Text = text
    }
    
    
    //MARK: Functions
    
    func ChangeText(to text: String) {
        m_Text = text
    }
    
    func ChangeTitle(to title: String) {
        m_Title = title
    }
    
    
    //MARK: Hashable
    static func == (lhs: Mantra, rhs: Mantra) -> Bool {
        return lhs.m_Id == rhs.m_Id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(m_Id)
        hasher.combine(m_Title)
        hasher.combine(m_Text)
    }
    
    
    //MARK: NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(m_Id, forKey: CodingKeys.id.rawValue)
        coder.encode(m_Title, forKey: CodingKeys.title.rawValue)
        coder.encode(m_Text, forKey: CodingKeys.text.rawValue)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
}
