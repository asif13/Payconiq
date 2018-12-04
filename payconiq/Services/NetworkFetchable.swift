//
//  NetworkFetchable.swift
//  payconiq
//
//  Created by Asif Junaid on 11/28/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
import Alamofire

enum NetworkResponseStatus {
    case success(Bool,Data) //Bool - Is there more paginated data to follow
    case failure(String)
}

protocol NetworkFetchable {
    func getData(url : URL, completion: @escaping ((NetworkResponseStatus) -> ()))
}

extension NetworkFetchable {
    
    /// Fetch data from server
    ///
    /// - Parameters:
    ///   - url: url to fetch data from
    ///   - completion: completion block for passing success or failure
    func getData(url : URL, completion: @escaping ((NetworkResponseStatus) -> ())){
        Alamofire.request(url).responseJSON { (response) in
         
            let error = response.error
            guard error == nil else {
                completion(.failure(error?.localizedDescription ?? NetworkErrors.serverError))
                return
            }
            
            guard let data = response.data else {
                completion(.failure(NetworkErrors.serverError))
                return
            }
            guard let headers = response.response?.allHeaderFields,
                  let nextUrlString = headers["next-page"] as? String,
                  let nextUrl = URL(string: nextUrlString)
            else {
                completion(.success(false, data))
                return
            }
            completion(.success(true, data))

            //If there is next-url, fetch data
            self.getData(url: nextUrl, completion: completion)
        }
    }
    
}
