//
//  DailyAblutionsTests.swift
//  DailyAblutionsTests
//
//  Created by Derek Noble on 4/13/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import XCTest
@testable import DailyAblutions

class MantraTests: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEquality() throws {
        let standardId: UInt = 1
        let ignoreText = "Not a complete."
        
        let standardMantra = Mantra(id: standardId, text: ignoreText)
        
        //same ids should be equal
        let identicalControlMantra = Mantra(id: standardId, text: ignoreText)
        XCTAssertEqual(standardMantra, identicalControlMantra)
        
        //differing ids should be unequal
        let differentIdControlMantra = Mantra(id: 2, text: ignoreText)
        XCTAssertNotEqual(standardMantra, differentIdControlMantra)
    }
    
    func testInits() throws {
        //init() creates a Mantra with the following fields:
        let basicMantra = Mantra(id: 0, text: "")
        let basicTestMantra = Mantra()
        XCTAssertTrue(Mantra.InstancesHaveEqualFields(basicTestMantra, basicMantra))
        
        
        //init(id:, text:) sets the id and text by parameter and viewedToday as false
        let customId: UInt = 3
        let customText = "You are a woke hearing impaired person"
        let customTestMantra = Mantra(id: customId, text: customText)
        let customMantra = Mantra(id: customId, text: customText)
        XCTAssertTrue(Mantra.InstancesHaveEqualFields(customTestMantra, customMantra))
        
        let differentId: UInt = 5
        let differentIdMantra = Mantra(id: differentId, text: customText)
        XCTAssertFalse(Mantra.InstancesHaveEqualFields(customTestMantra, differentIdMantra))
        XCTAssertFalse(differentIdMantra.m_ViewedToday)
        
        let differentText = "I HAVE THE PANTS"
        let differentTextMantra = Mantra(id: customId, text: differentText)
        XCTAssertFalse(Mantra.InstancesHaveEqualFields(customTestMantra, differentTextMantra))
        XCTAssertFalse(differentTextMantra.m_ViewedToday)
        
        let differentIdAndTextMantra = Mantra(id: differentId, text: differentText)
        XCTAssertFalse(Mantra.InstancesHaveEqualFields(customMantra, differentIdAndTextMantra))
        XCTAssertFalse(differentIdAndTextMantra.m_ViewedToday)
        
        
        //init?(coder: ) sets the id and text by file and viewedToday as false
        let sampleData: [String: Codable] = [Mantra.PropertyKeys.ID: 3, Mantra.PropertyKeys.TEXT: "Not a complete."]
        /*
         //Write the sample data to the TestDataContainer file
        TestUtilities.WriteToTestDataContainer([sampleData])
         //Initialize a new Mantra from the file
         //Mock a test Mantra with the same id and text
         //Assert that the Mantras have equal fields
         
         //same song and dance as above
        */
    }
    
    func testStartANewDay() throws {
        //sets a true ViewedToday to false
        let viewedMantra = Mantra(id: 0, text: "")
        viewedMantra.StartANewDay()
        XCTAssertFalse(viewedMantra.m_ViewedToday)
        
        //leaves a false ViewedToday unchanged
        let unviewedMantra = Mantra(id: 0, text: "")
        unviewedMantra.StartANewDay()
        XCTAssertFalse(unviewedMantra.m_ViewedToday)
    }
    
    func testCheckTodayOff() throws {
        // sets a false ViewedToday to true
        let unviewedMantra = Mantra(id: 0, text: "")
        unviewedMantra.CheckTodayOff()
        XCTAssertTrue(unviewedMantra.m_ViewedToday)
        
        //leaves a true ViewedToday unchanged
        let viewedMantra = Mantra(id: 0, text: "")
        viewedMantra.CheckTodayOff()
        XCTAssertTrue(viewedMantra.m_ViewedToday)
    }
    
    func testChangeText() throws {
        //overwrites the text
        let newText = "This is awkward."
        let editingMantra = Mantra(id: 0, text: "Well then")
        editingMantra.ChangeText(to: newText)
        XCTAssertEqual(editingMantra.m_Text, newText)
    }
    
    func testDescription() throws {
        //description shows the mantra's properties in an organized format
        let mantra = Mantra(id: 2, text: "Not a complete.")
        XCTAssertEqual(mantra.description, "\nId: 2\nText: Not a complete.\nViewedToday: true")
    }
    
    func testHash() throws {
        //hashing combines the text, id, and ViewedToday properties
        let id: UInt = 1
        let text = "Not a complete."
        let viewedToday = false
        let mantra = Mantra(id: id, text: text)
        
        var mantraHasher = Hasher()
        mantra.hash(into: &mantraHasher)
        
        var manualHasher = Hasher()
        manualHasher.combine(id)
        manualHasher.combine(text)
        manualHasher.combine(viewedToday)
        
        XCTAssertEqual(manualHasher.finalize(), mantraHasher.finalize())
    }
    
    func testEncode() throws {
        //encoding includes only the id and text properties
        let id: UInt = 1
        let text = "Not a complete."
        let viewedToday = false
        let mantra = Mantra(id: id, text: text)
        
        let mantraEncoder = NSKeyedArchiver(requiringSecureCoding: true)
        mantra.encode(with: mantraEncoder)
        mantraEncoder.finishEncoding()
        
        let manualEncoder = NSKeyedArchiver(requiringSecureCoding: true)
        mantraEncoder.encode(id, forKey: Mantra.CodingKeys.m_Id.rawValue)
        mantraEncoder.encode(text, forKey: Mantra.CodingKeys.m_Text.rawValue)
        manualEncoder.finishEncoding()
        
        XCTAssertEqual(mantraEncoder.encodedData, manualEncoder.encodedData)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
