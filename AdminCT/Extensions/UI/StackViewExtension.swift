//
//  StackViewExtension.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/19/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit


extension UIStackView {
    func addArrangedSubview(views : [UIView]) {
        for v in views {
            addArrangedSubview(v)
        }
    }
}
