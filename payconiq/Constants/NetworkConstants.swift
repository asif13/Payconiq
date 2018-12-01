//
//  NetworkUrls.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation

enum NetworkConstants {
    private static let baseUrl = "http://demo5481020.mockable.io"
    
    case transactionList
    case user
    
    var endPoint: URL {
        switch self {
        case .transactionList:
            return URL(string: "\(NetworkConstants.baseUrl)/transactions")!
        case .user:
            return URL(string: "\(NetworkConstants.baseUrl)/userinfo")!
        }
    }
    
}

