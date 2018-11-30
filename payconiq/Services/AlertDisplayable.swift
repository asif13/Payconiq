//
//  AlertDisplayable.swift
//  payconiq
//
//  Created by Asif Junaid on 11/29/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation
import UIKit

protocol AlertDisplayable {
    func displayAlert(with title: String, message: String)
}

extension AlertDisplayable where Self: UIViewController {
    func displayAlert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true)
    }
}
