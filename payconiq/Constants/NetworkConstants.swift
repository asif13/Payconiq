//
//  NetworkUrls.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation

enum NetworkConstants {
    case transactionList
    
    var endPoint: URL {
        switch self {
        case .transactionList:
            return URL(string: "http://demo5481020.mockable.io/transactions")!
        }
    }
}

