//
//  DataService.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/30/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import CodableFirebase

class DataService {
    
    private static let organizationReference = Database.database(url: "https://charity-3bade-867ae.firebaseio.com").reference().child("organization")
    
    private static let storageReference = Storage.storage().reference()
    
    
    //MARK:- DataBase Real Time Reference
    
    /// Get All Organization
    /// - Parameter completionHandler: Return List Of Organizations
    static func getAllOrganizations(completionHandler: @escaping ((ListOrganization?,Error?) -> Void)) {
        organizationReference.observeSingleEvent(of: .value) { (snapshot) in
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
        
        organizationReference.child(name).observeSingleEvent(of: .value) { (snapshot) in
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
    
    
    /// Create New Organization
    /// - Parameters:
    ///   - name: Name of Organization
    ///   - icon: Icon URL
    ///   - amount: Amoun org Organization and by default is 0
    ///   - url: URL address of Organization
    ///   - desc: Organization Description
    static func createOrganization(name              : String,
                                   icon              : String,
                                   amount            : Int = 0,
                                   url               : String,
                                   desc              : String,
                                   completionHandler : @escaping (Organization?,Error?) -> Void
                                   ) {
        
        let organization = Organization(name: name, icon: icon, amount: amount, url: url , desc: desc)
        
        let data = try! FirebaseEncoder().encode(organization)
        
        organizationReference.child(name).setValue(data) { (error, _ ) in
            
            //Created Organization
            if error != nil {
                completionHandler(nil,error)
                return
            }
            
             completionHandler(organization,nil)
           
        }
    }
    
    
    /// Update Organization
    /// - Parameters:
    ///   - organization: Organization
    ///   - completionHandler: Complete (Organization, Error)
    static func updateOrganization(organization : Organization, completionHandler : @escaping (Organization?,Error?) -> Void) {
         let data = try! FirebaseEncoder().encode(organization)
        
        guard let name = organization.name else { return  }
         
         organizationReference.child(name).setValue(data) { (error, _ ) in
            
            //Created Organization
            if error != nil {
                completionHandler(nil,error)
                return
            }
            
             completionHandler(organization,nil)
           
        }
    }
    

    
    //MARK:- Data Storage
    static func uploadImage(data : Data) {
        
        let uploadTask = storageReference.child("demo_admin.png").putData(data, metadata: nil) { (storageRefer, error) in
           
            if error == nil {
                print("UPLOADED : \(storageRefer?.storageReference?.fullPath)")
                return
                
            }
            
            print(error.debugDescription)
      
        }
        
    }
    
    
    
    
    
    
    
}
