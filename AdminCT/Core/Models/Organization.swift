//
//  Organization.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/27/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//



import Foundation

struct Organization: Codable {
    let name: String
    let icon: String
    let amount: Int
    let url: String
    let desc: String
    
    init() {
        self.init(name: "", icon: "", amount: 0, url: "", desc: "")
    }
    
    init(name : String, icon : String, amount : Int, url : String, desc : String) {
        self.name = name
        self.icon = icon
        self.amount = amount
        self.url = url
        self.desc = url
    }
    
    
}

typealias ListOrganization = [String: Organization]

