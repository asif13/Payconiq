//
//  User.swift
//  payconiq
//
//  Created by Asif Junaid on 12/1/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation

struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case surname = "surname"
        case birthdateStr = "Birthdate"
        case nationality = "Nationality"
    }
    let name: String?
    let surname: String?
    let birthdateStr: String?
    let nationality: String?
    var fullName: String {
        return (name ?? "") + " " + (surname ?? "")
    }
    var birthdate: String? {
        return birthdateStr?.date(format: "dd/mm/yyyy", toFormat: DateFormat.date)
    }
}
