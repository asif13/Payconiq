//
//  String+Extensions.swift
//  payconiq
//
//  Created by Asif Junaid on 11/29/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

extension String {
    var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
 
    /// Convert date from server fomat to app format
    ///
    /// - Parameters:
    ///   - format: server date format
    ///   - toFormat: app date format
    /// - Returns: date in string
    func date(format: String , toFormat : String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let date =  formatter.date(from: self) else { return nil}
        formatter.dateFormat = toFormat
        return formatter.string(from: date)
    }
}
