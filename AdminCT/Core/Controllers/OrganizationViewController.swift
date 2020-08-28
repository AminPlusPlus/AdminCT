//
//  OrganizationViewController.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/27/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import SnapKit

class OrganizationViewController: UIViewController {
    
    var organization : Organization?  {
        didSet {
            guard let org = organization else { return  }
            self.titleTextField.text      = org.name
            self.descriptionTextView.text = org.desc
            self.urlTextField.text        = org.url
        }
    }
    
    //MARK:- UI Elements
    fileprivate var scrollView = UIScrollView()
    fileprivate var stackView : UIStackView = {
        let stackView          = UIStackView()
        stackView.spacing      = 5
        stackView.axis         = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment    = .fill
        return stackView
    }()
    fileprivate var logoImageView : UIImageView = {
        let imageView           = UIImageView()
        imageView.image         = UIImage(systemName: "plus.circle.fill")
        imageView.contentMode   = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    fileprivate var titleLabel     : UILabel = {
        let label = UILabel()
        label.text = "Name Of Organization"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    fileprivate var titleTextField : CTUITextField = {
        let textField           = CTUITextField()
        textField.placeholder   = "Add name of organization"
        
        return textField
    }()
    fileprivate var descriptionTextView : UITextView = {
         let textView            = UITextView()
         textView.text           = "Add description"
         textView.isScrollEnabled = false
     //    textView.textColor      = UIColor.lightGray
         
         return textView
     }()
     fileprivate var urlTextField : UITextField = {
         let textField           = UITextField()
         textField.placeholder   = "Add Website address"
        
         
         return textField
     }()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initView()
        
        
    }
   
    
    private func initView () {
        view.backgroundColor = UIColor.systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action:#selector(save(_:)))
        
        navigationItem.rightBarButtonItem!.isEnabled = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(views: [logoImageView,titleLabel,titleTextField,urlTextField,descriptionTextView,])
        
        
        //MARK:- Constains
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.view)
            make.left.right.equalTo(self.view).inset(20)
        }
    
        stackView.snp.makeConstraints { (make) in
            make.width.equalTo(scrollView)
        }
        logoImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
        }
    }
    
    
    @objc func save(_ sender : UIButton) {
        
    }

}
