//
//  DataService.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/30/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class DataService {
    
    static var cache = NSCache<NSString,UIImage>()

    static func fetch(forUrl url: String, completionHandler: @escaping ((ListOrganization?,Error?) -> Void)) {
       
        guard let url = URL(string: url) else {
            completionHandler(nil,NetworkError.urlInvalid(message: "URL is not correct"))
            return
            
        }
        
        let request = URLSession.shared.dataTask(with: url) { (data, responce, error) in
           
            //if somethign wrong most case no wireless connection
            if let err = error  {
                completionHandler(nil,NetworkError.generalError(message: err.localizedDescription))
                return
            }
        
            //Checking repsonce is 200
            guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
                completionHandler(nil,NetworkError.invalidPayload)
                return
            }
        
            //check for valida Data from server
            guard let data = data else {
                completionHandler(nil, NetworkError.generalError(message: "Data received is invalid"))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let org = try decoder.decode(ListOrganization.self, from: data)
                
                completionHandler(org,nil)
                
            }catch {
                completionHandler(nil,NetworkError.invalidPayload)
            }
        
        }
        
        request.resume()
    }
    
}
