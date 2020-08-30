//
//  Extensions.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/30/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

extension Dictionary {
    subscript(i:Int) -> (key:Key,value:Value) {
        get {
            return self[index(startIndex,offsetBy: i)]
        }
    }
}
