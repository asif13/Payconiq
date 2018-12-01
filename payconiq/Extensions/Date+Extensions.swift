//
//  Date+Extensions.swift
//  payconiq
//
//  Created by Asif Junaid on 12/1/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
struct DateFormat {
    static let date = "dd-mm-yy"
}
extension Date {
    static let dateFormatter = DateFormatter()

    func string(format: String) -> String {
        Date.dateFormatter.dateFormat = format
        return Date.dateFormatter.string(from: self)
    }
}
