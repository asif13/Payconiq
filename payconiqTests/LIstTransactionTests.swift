//
//  LIstTransactionTests.swift
//  payconiqTests
//
//  Created by Asif Junaid on 12/3/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import XCTest
@testable import payconiq

class ListTransactionTests: XCTestCase {
    var viewModel: ListTransactionsViewModel?
    override func setUp() {
        viewModel = ListTransactionsViewModel()
        viewModel?.appendTransactions(loadTransactionStub())
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func loadTransactionStub()->[Transaction]{
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "transactions", ofType: "json")
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped) else {
            return []
        }
        let decoder = JSONDecoder()
        guard let transactions = try? decoder.decode([Transaction].self, from: data) else {
            return []
        }
        print(transactions)
        return transactions
    }
    func testTransactionListService(){
        let promise = expectation(description: "Expecting data from transation serivce")

        viewModel?.getData(url: NetworkConstants.transactionList.endPoint, completion: { (status) in
            switch status {
            case .success(_, _): break
            case .failure(let error):
                XCTFail(error)
            }
            promise.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    func testTotalBalance(){
        let totalBalance = viewModel?.getTotalBalance() ?? 0
       XCTAssertEqual(totalBalance, 699.51,"Total balance from transation is wrong")
    }
    func testTransactionDebitFilter(){
         viewModel?.filterTransactions(.debit)
        guard let depositTransation = viewModel?.filteredTransactions.filter({ (transation) -> Bool in
            return transation.amount >= 0
        }) else {
            XCTFail("Could not get count for filter transations")
            return
        }
        
        XCTAssertEqual(depositTransation.count, 0,"Debit filtered transaction contains positive amount")
    }
    func testTransactionDepositFilter(){
        viewModel?.filterTransactions(.deposit)
        guard let debitransation = viewModel?.filteredTransactions.filter({ (transation) -> Bool in
            return transation.amount < 0
        }) else {
            XCTFail("Could not get count for filter transations")
            return
        }
        
        XCTAssertEqual(debitransation.count, 0,"Deposit filtered transaction contains negative amount")
    }
}
