//
//  Friend.swift
//  3_JSONHandle
//
//  Created by YunHo on 2021/06/12.
//

import Foundation

struct Friend: Codable {
    
    struct Address: Codable {
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let address: Address
    
    var nameAndAge: String {
        return self.name + "(\(self.age)"
    }
    
    var fullAddress: String {
        return self.address.city + ", " + self.address.country
    }
    
    enum CondingKeys: String, CodingKey {
        case name, age
        case address = "address_info"
    }
}
