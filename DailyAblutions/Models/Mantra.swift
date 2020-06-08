//
//  Mantra.swift
//  DailyAblutions
//
//  Created by Derek Noble on 6/5/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import Foundation

class Mantra: Hashable, NSCoding, Identifiable, CustomStringConvertible {
    
    class PropertyKeys {
        static let ID: String = CodingKeys.m_Id.rawValue
        static let TEXT: String = CodingKeys.m_Text.rawValue
    }
    
    //MARK: Fields
    internal var m_Id: UInt
    internal var m_Text: String
    internal var m_ViewedToday: Bool
    
    var description: String {
        return "\nId: \(m_Id)\nText: \(m_Text)\nViewedToday: \(m_ViewedToday)"
    }
    
    var text: String {
        let copy = m_Text
        return copy
    }
    
    var id: UInt {
        let copy = m_Id
        return copy
    }
    
    var viewedToday: Bool {
        let copy = m_ViewedToday
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
        m_ViewedToday = false
    }
    
    init(id: UInt, text: String) {
        m_Id = id
        m_Text = text
        m_ViewedToday = false
    }
    
    
    //MARK: Functions
    func StartANewDay() {
        m_ViewedToday = false
    }
    
    func CheckTodayOff() {
        m_ViewedToday = true
    }
    
    func ChangeText(to text: String) {
        m_Text = text
    }
    
    
    //MARK: Hashable
    static func == (lhs: Mantra, rhs: Mantra) -> Bool {
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(m_Id)
        hasher.combine(m_Text)
        hasher.combine(m_ViewedToday)
    }
    
    
    //MARK: NSCoding
    func encode(with coder: NSCoder) {
        
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
}
