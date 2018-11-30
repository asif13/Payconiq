//
//  ListTransactionsViewController.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class ListTransactionsViewController: UIViewController,AlertDisplayable,NVActivityIndicatorViewable {
   
    @IBOutlet weak var accountBalance: UILabel!
    let viewModel = ListTransactionsViewModel()
    @IBOutlet weak var transactionListTbl: UITableView!
    let cellIdentifier = "ListTransactionCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTransactions()
    }
    @IBAction func transactionTypeChanged(_ sender: UISegmentedControl) {
        guard let filterType = TransactionType(rawValue: sender.selectedSegmentIndex) else { return}
        viewModel.filterTransactions(filterType)
        transactionListTbl.reloadData()
    }
    func fetchTransactions(){
        startAnimating(message: "Loading".localizedString, type: .circleStrokeSpin)
        viewModel.fetchTransactions(successBlock: { isFinal in
            DispatchQueue.main.async { [weak self] in
                
                self?.transactionListTbl.reloadData()
                self?.stopAnimating()
                if isFinal {
                    if let sum = self?.viewModel.getTotalBalance(){
                        self?.accountBalance.text = PayconiqUtilities.parseAmountToCurrency("\(sum)")
                    }
                }
                
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
        return viewModel.filteredTransactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListTransactionTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(transaction: viewModel.filteredTransactions[indexPath.row])
        return cell
    }

}
