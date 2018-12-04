//
//  ListTransactionsViewModel.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

enum TransactionType : Int {
    case all = 0
    case debit
    case deposit
}

class ListTransactionsViewModel: NetworkFetchable {
    private var transactions = [Transaction](){
        didSet {
            //set filtered transaction when transactions is set
            filteredTransactions = transactions
        }
    }
    var filteredTransactions = [Transaction]()
    func fetchTransactions(successBlock: @escaping ((_ isFinal:Bool)->()),failureBlock: @escaping ((String)->())){
        getData(url: NetworkConstants.transactionList.endPoint) { [weak self] (response) in

            switch response {
                
            case .success(let isFinal,let data):
                let decoder = JSONDecoder()
                guard let transactions = try? decoder.decode([Transaction].self, from: data) else {
                    return
                }
                self?.appendTransactions(transactions)
                successBlock(isFinal)

            case .failure(let error):
                failureBlock(error)
            }
        }
    }
    func appendTransactions(_ result: [Transaction]){
        transactions.append(contentsOf: result)
    }
    func getTotalBalance()->Double{
       return transactions.reduce(into: 0) { (result, transaction) in
            result = result + transaction.amount
        }
    }
    func filterTransactions(_ type: TransactionType){
        switch type {
            
        case .all:
            filteredTransactions = transactions
        case .debit:
            filteredTransactions = transactions.filter({$0.amount < 0})
        case .deposit:
            filteredTransactions = transactions.filter({$0.amount >= 0})
        }
    }
}
