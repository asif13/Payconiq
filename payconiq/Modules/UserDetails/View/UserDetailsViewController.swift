//
//  UserDetailsViewController.swift
//  payconiq
//
//  Created by Asif Junaid on 12/1/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class UserDetailsViewController: UIViewController,AlertDisplayable,NVActivityIndicatorViewable {
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var birthAndCountryDetailsLbl: UILabel!
    
    let viewModel = UserDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserDetails()
    }

    /// Initiate user details loading
    func loadUserDetails(){
        startAnimating(message: "Loading".localizedString, type: .circleStrokeSpin)
        viewModel.fetchUser(successBlock: {
            DispatchQueue.main.async { [weak self] in
                self?.updateUserDetails()
                self?.stopAnimating()
            }
        }) { (error) in
            DispatchQueue.main.async { [weak self] in
                self?.stopAnimating()
                self?.displayAlert(with: "Error".localizedString, message: error.localizedString)
            }
        }
    }
    /// Update outlets with user information
    func updateUserDetails(){
        userNameLbl.text = viewModel.model?.fullName
        birthAndCountryDetailsLbl.text = viewModel.getExtraInfoOnUser()
    }
}
