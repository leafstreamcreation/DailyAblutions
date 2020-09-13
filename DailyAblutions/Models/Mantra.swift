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
    
    var description: String {
        return "\nId: \(m_Id)\nText: \(m_Text)"
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
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(m_Id)
        hasher.combine(m_Text)
    }
    
    
    //MARK: NSCoding
    func encode(with coder: NSCoder) {
        
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
}
