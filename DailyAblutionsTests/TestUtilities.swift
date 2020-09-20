//
//  TestUtilities.swift
//  DailyAblutionsTests
//
//  Created by Derek Noble on 6/6/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import Foundation
@testable import DailyAblutions

class TestUtilities {
    static private let TESTDATAPATH: URL = Bundle.main.url(forResource: "TestDataContainer", withExtension: "da")!
    
    static func WriteToTestDataContainer(_ objects: [[String: Codable]]) {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        for object in objects {
            for key in object.keys {
                archiver.encode(object[key], forKey: key)
            }
        }
        archiver.finishEncoding()
        do {
            try archiver.encodedData.write(to: TESTDATAPATH)
        } catch {
            print("Write to Test Data Container Failed")
        }
    }
}

extension Mantra {
//    convenience init(id: UInt, text: String) {
//        self.init()
//        m_Id = id
//        m_Text = text
//    }
    
    static func InstancesHaveEqualFields(_ firstMantra: Mantra, _ secondMantra: Mantra) -> Bool {
        if firstMantra.m_Id != secondMantra.m_Id {
            print("Id '\(firstMantra.m_Id)' does not equal '\(secondMantra.m_Id)'")
            return false
        }
        else if firstMantra.m_Title != secondMantra.m_Title {
            print("Title '\(firstMantra.m_Title)' does not equal '\(secondMantra.m_Title)'")
            return false
        }
        else if firstMantra.m_Text != secondMantra.m_Text {
            print("Text '\(firstMantra.m_Text)' does not equal '\(secondMantra.m_Text)'")
            return false
        }
        else { return true }
    }
}
