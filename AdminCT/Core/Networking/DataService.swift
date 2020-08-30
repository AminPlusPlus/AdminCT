//
//  DataService.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/30/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import FirebaseDatabase
import CodableFirebase

class DataService {
    
    private static let reference = Database.database(url: "https://charity-3bade-867ae.firebaseio.com").reference()
    
    
    /// Get All Organization
    /// - Parameter completionHandler: Return List Of Organizations
    static func getAllOrganizations(completionHandler: @escaping ((ListOrganization?,Error?) -> Void)) {
        reference.child("organization").observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value else {return}
            
            do {
                let orgs = try FirebaseDecoder().decode(ListOrganization.self, from: value)
                completionHandler(orgs,nil)
            }
            catch let error {
                completionHandler(nil,error)
            }
           
        }
    }
    
    
    
    /// Get Organization by item
    /// - Parameters:
    ///   - name: Name of Organization
    ///   - completionHandler: Return Organization
    static func getOrganization(name: String,completionHandler: @escaping ((Organization?,Error?) -> Void)) {
        
        reference.child("organization/\(name)").observeSingleEvent(of: .value) { (snapshot) in
                   guard let value = snapshot.value else {return}
                   
                   do {
                       let org = try FirebaseDecoder().decode(Organization.self, from: value)
                       completionHandler(org,nil)
                   }
                   catch let error {
                       completionHandler(nil,error)
                   }
                  
          }
    }
}
