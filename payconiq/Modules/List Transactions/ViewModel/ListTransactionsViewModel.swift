//
//  ListTransactionsViewModel.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

class ListTransactionsViewModel: NetworkFetchable {
    var transactions = [Transaction]()
    func fetchTransactions(successBlock: @escaping (()->()),failureBlock: @escaping ((String)->())){
        getData(url: NetworkConstants.transactionList.endPoint) { [weak self] (response) in

            switch response {
                
            case .success(_ ,let data):
                let decoder = JSONDecoder()
                guard let transactions = try? decoder.decode([Transaction].self, from: data) else {
                    return
                }
                self?.transactions.append(contentsOf: transactions)
                successBlock()

            case .failure(let error):
                failureBlock(error)
            }
        }
    }
}
