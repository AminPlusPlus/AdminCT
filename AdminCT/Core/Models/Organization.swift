//
//  Organization.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/27/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//



import Foundation

struct Organization: Codable {
    let name: String?
    let icon: String?
    let amount: Int?
    let url: String?
    let desc: String?
}

typealias ListOrganization = [String: Organization]

