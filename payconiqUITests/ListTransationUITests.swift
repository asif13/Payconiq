//
//  ListTransationUITests.swift
//  payconiqUITests
//
//  Created by Asif Junaid on 12/4/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import XCTest

class ListTransationUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {

        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func testListFilterSegmentWorking(){

        let deposit = app.buttons["Deposit"]
        let all = app.buttons["All"]
        let debit = app.buttons["Debit"]

        deposit.tap()
        XCTAssertEqual(deposit.isSelected, true,"Deposit tab should be selected")

        debit.tap()
        XCTAssertEqual(debit.isSelected, true,"Debit tab should be selected")

        all.tap()
        XCTAssertEqual(all.isSelected, true,"All tab should be selected")
        
    }
    func testExpandedList(){
        
        let tablesQuery = app.tables
        let transaction1 = tablesQuery.firstMatch
        transaction1.tap()
        XCTAssertEqual(transaction1/*@START_MENU_TOKEN@*/.buttons["Open Map"]/*[[".cells.buttons[\"Open Map\"]",".buttons[\"Open Map\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists, true,"Open map button shoud be visible on tap")

    }
    func testOpeningOfMap(){
        
        let tablesQuery = app.tables
        let transaction1 = tablesQuery.firstMatch
        transaction1.tap()
       
        transaction1/*@START_MENU_TOKEN@*/.buttons["Open Map"]/*[[".cells.buttons[\"Open Map\"]",".buttons[\"Open Map\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let pin = app.maps.element(boundBy: 0)
        
        XCTAssertEqual(pin.exists, true,"Map should exist")
    }
}
