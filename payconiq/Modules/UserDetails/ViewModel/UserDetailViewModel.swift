//
//  UserDetailViewModel.swift
//  payconiq
//
//  Created by Asif Junaid on 12/1/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation

class UserDetailViewModel: NetworkFetchable {
    var model: User?
    /// Fetch user data
    ///
    /// - Parameters:
    ///   - successBlock: blocked called on success
    ///   - failureBlock: blocked called on failure
    func fetchUser(successBlock: @escaping (()->()),failureBlock: @escaping ((String)->())){
        getData(url: NetworkConstants.user.endPoint) { [weak self] (status) in
            switch status {
            case .success(_, let data):
                let decoder = JSONDecoder()
                guard let user = try? decoder.decode(User.self, from: data) else {
                    return
                }
                self?.model = user
                successBlock()
            case .failure(let error):
                failureBlock(error)
            }
        }
    }
    /// Create a message to display extra user info
    ///
    /// - Returns: message 
    func getExtraInfoOnUser()->String{
        return "Born on ".localizedString + (model?.birthdate ?? "") + " in ".localizedString + (model?.nationality ?? "")
    }
}
