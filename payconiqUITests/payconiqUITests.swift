//
//  payconiqUITests.swift
//  payconiqUITests
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import XCTest

class payconiqUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func testTabBarNavigationToUser() {
        
        app.tabBars.buttons["Profile"].tap()
        let navigationTitle = app.navigationBars["User"].otherElements["User"]
        XCTAssertEqual(navigationTitle.exists, true,"Navigation title should be User")

    }

}
