//
//  ViewController.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/30/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import SnapKit

extension UIViewController {
    
    
    //MARK:- Acitivity Indicator
    /// Acitivity Indicator
    /// - Parameter style: Set style of Indicator
    func startActivityIndicator() {
        let indicator                         = UIActivityIndicatorView(style: .large)
        indicator.color                       = UIColor(named: "ActivityIndicator")
        let indicatorView                     = UIView()
        indicatorView.clipsToBounds           = true
        indicatorView.layer.cornerRadius      = 20
        indicatorView.alpha                   = 0.9
        
        indicatorView.backgroundColor         = UIColor(named: "BGIndicator")
        indicatorView.accessibilityIdentifier = "spinner"
        
        
        view.addSubview(indicatorView)
        indicatorView.addSubview(indicator)
        
        //Constrains
        indicatorView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-90)
            make.width.height.equalTo(150)
        }
        
        indicator.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        
        indicator.startAnimating()
    }
    
    
    /// Stop Activity Indicator
    func stopActivityIndicator() {
        for case let indicator in view.subviews {
            guard indicator.accessibilityIdentifier == "spinner" else {return}
            indicator.removeFromSuperview()
        }
    }
    
    
    //MARK:- Alert Indicator
    func alertView(title : String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok      = UIAlertAction(title: "Okay", style: .default, handler: nil)
       
        alertController.addAction(ok)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
 
