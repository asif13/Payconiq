//
//  UIStoryboard+Extension.swift
//  payconiq
//
//  Created by Asif Junaid on 12/3/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    /// Return an instance of UIViewcontroller
    ///
    /// - Parameters:
    ///   - name: Storyboard name
    ///   - bundle: bundle name
    ///   - identifier: Identifer for UIViewcontroller
    /// - Returns: Instance of Viewcontoller
    class func instance<T: UIViewController>(name: String = "Main", bundle: Bundle? = nil, identifier: String? = nil) -> T? {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        
        var viewController: T? = nil
        if let identifier = identifier {
            viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T
        } else {
            viewController = storyboard.instantiateInitialViewController() as? T
        }
        
        return viewController
    }
}
