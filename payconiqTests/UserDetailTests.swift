//
//  UserDetailTests.swift
//  payconiqTests
//
//  Created by Asif Junaid on 12/4/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import XCTest
@testable import payconiq

class UserDetailTests: XCTestCase {
    var viewModel: UserDetailViewModel?
    override func setUp() {
        viewModel = UserDetailViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
    }
    func testTransactionListService(){
        let promise = expectation(description: "Expecting data from user serivce")
        
        viewModel?.getData(url: NetworkConstants.user.endPoint, completion: { (status) in
            switch status {
            case .success(_, _): break
            case .failure(let error):
                XCTFail(error)
            }
            promise.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
    }
}
