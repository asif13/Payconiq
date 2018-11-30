//
//  ListTransactionsViewController.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
class ListTransactionsViewController: UIViewController,AlertDisplayable {
    let viewModel = ListTransactionsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTransactions()
    }
    func fetchTransactions(){
        viewModel.fetchTransactions(successBlock: { (transactions) in
            DispatchQueue.main.async { [weak self] in
                print(transactions)
            }
        }) { (error) in
            DispatchQueue.main.async { [weak self] in
                self?.displayAlert(with: "Error".localizedString, message: error.localizedString)
            }
        }
    }
}
