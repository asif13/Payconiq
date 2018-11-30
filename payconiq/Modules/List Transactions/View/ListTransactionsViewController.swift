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
    @IBOutlet weak var transactionListTbl: UITableView!
    let cellIdentifier = "ListTransactionCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTransactions()
    }
    func fetchTransactions(){
        viewModel.fetchTransactions(successBlock: {
            DispatchQueue.main.async { [weak self] in
                self?.transactionListTbl.reloadData()
            }
        }) { (error) in
            DispatchQueue.main.async { [weak self] in
                self?.displayAlert(with: "Error".localizedString, message: error.localizedString)
            }
        }
    }
}

extension ListTransactionsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListTransactionTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(transaction: viewModel.transactions[indexPath.row])
        return cell
    }

}
