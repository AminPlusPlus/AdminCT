//
//  Networking.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/30/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

enum NetworkError : Error {
    case urlInvalid(message : String)
    case generalError(message:String)
    case invalidPayload
    
    
    var errorDesription : String? {
        switch self {
        case .urlInvalid(message: let message):
            return message
        case .invalidPayload:
            return "Payload data is not Okay"
        case .generalError(message: let message):
            return message
        }
    }
}

protocol Networking  {
    func fetch (forUrl url : String, completionHandler : @escaping (([Any]?,Error?) -> Void))
}
