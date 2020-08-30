//
//  CTUITextField.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/28/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class CTUITextField: UITextField, UITextFieldDelegate{
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self

        initView()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //MARK:- Init TextField View
    private func initView(){
        
        font            = UIFont.systemFont(ofSize: 15, weight: .medium)
        borderStyle     = .line
        returnKeyType   = .done
                
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
