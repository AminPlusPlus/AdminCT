//
//  CTUITextField.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/28/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class CTUITextField: UITextField {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bottomLine = CALayer()
        print(frame.height)
        bottomLine.frame = CGRect(x: 0.0, y: frame.height - 1, width: frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.red.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
