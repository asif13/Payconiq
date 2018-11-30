//
//  ListTransactionsViewModel.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

class ListTransactionsViewModel: NetworkFetchable {

    func fetchTransactions(successBlock: @escaping ((_ transactions : [Transaction])->()),failureBlock: @escaping ((String)->())){
        getData(url: NetworkConstants.transactionList.endPoint) { (response) in

            switch response {
                
            case .success(let data):
                let decoder = JSONDecoder()
                guard let transactions = try? decoder.decode([Transaction].self, from: data) else {
                    return
                }
                
                successBlock(transactions)
                
            case .failure(let error):
                failureBlock(error)
            }
        }
    }
}
