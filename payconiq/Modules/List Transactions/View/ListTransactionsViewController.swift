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
    enum cellIdenitfiers:String {
        case `default` = "ListTransactionCell"
        case expanded = "ListTransactionExpandedCell"
    }
    var expandedCellIndexes = Set<Transaction>()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTransactions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       tabBarController?.navigationItem.title =  "Transactions".localizedString
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
                self?.stopAnimating()
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
        let transaction = viewModel.filteredTransactions[indexPath.row]
        let cellIdentifer:cellIdenitfiers = expandedCellIndexes.contains(transaction) ? .expanded : .default
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer.rawValue, for: indexPath) as? ListTransactionTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(transaction: transaction)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transaction = viewModel.filteredTransactions[indexPath.row]

        if expandedCellIndexes.contains(transaction) {
            expandedCellIndexes.remove(transaction)
        }else {
            expandedCellIndexes.insert(transaction)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}
