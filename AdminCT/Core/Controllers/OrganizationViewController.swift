//
//  OrganizationViewController.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/27/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import SnapKit

class OrganizationViewController: UIViewController{
    
    var organization : Organization?  {
        didSet {
            guard let org = organization else { return  }
            self.titleTextField.text      = org.name
            self.descriptionTextView.text = org.desc
            self.urlTextField.text        = org.url
            
            navigationItem.title = org.amount?.description
        }
    }
    
    //MARK:- UI Elements
    fileprivate var scrollView = UIScrollView()
    fileprivate var stackView : UIStackView = {
        let stackView          = UIStackView()
        stackView.spacing      = 5
        stackView.axis         = .vertical
        stackView.distribution = .fill
        stackView.alignment    = .fill
        return stackView
    }()
    fileprivate lazy var logoImageView : UIImageView = {
        [unowned self] in
        let imageView                      = UIImageView()
        imageView.image                    = UIImage(systemName: "plus.circle.fill")
        imageView.contentMode              = .scaleAspectFit
        imageView.clipsToBounds            = true
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius       = 50
        
        //Tap Gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openSelectImage(_:)) )
        imageView.addGestureRecognizer(tapGesture)
        
        return imageView
    }()
    fileprivate var titleLabel     : UILabel = {
        let label = UILabel()
        label.text = "Name Of Organization"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    fileprivate var titleTextField : CTUITextField = {
        let textField           = CTUITextField()
        textField.placeholder   = "Add name of organization"
        textField.keyboardType  = .alphabet
        return textField
    }()
    fileprivate var descriptionLabel     : UILabel = {
           let label = UILabel()
           label.text = "About Organization"
           label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
           return label
       }()
    fileprivate var descriptionTextView : UITextView = {
         let textView             = UITextView()
         textView.text            = "Add description"
         textView.isScrollEnabled = false
         textView.font            = UIFont.systemFont(ofSize: 15, weight: .medium)
        
         return textView
     }()
    fileprivate var urlLabel     : UILabel = {
           let label = UILabel()
           label.text = "Website Organization"
           label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
           return label
       }()
     fileprivate var urlTextField : CTUITextField = {
         let textField            = CTUITextField()
         textField.placeholder    = "Add Website address"
         textField.keyboardType   = .URL
         
         
         return textField
     }()
    
    
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(tapGesture)
        
        
        initView()
        
        //Image Picker Declaration
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        
    
    }
   

    private func initView () {
        view.backgroundColor = UIColor.systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action:#selector(save(_:)))
        
        navigationItem.rightBarButtonItem!.isEnabled = false
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator   = false
    
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(views: [logoImageView,
                                             titleLabel,titleTextField,urlLabel,
                                             urlTextField,descriptionLabel, descriptionTextView,])
        
     
        
        //MARK:- Constains
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.view)
            make.left.right.equalTo(self.view).inset(20)
        }
    
        stackView.snp.makeConstraints { (make) in
            make.width.equalTo(scrollView)
            make.bottom.top.equalTo(scrollView)
        }
       
        logoImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
        }
        
        
        titleTextField.snp.makeConstraints { (make) in
            make.height.equalTo(35)
        }
        urlTextField.snp.makeConstraints { (make) in
            make.height.equalTo(35)
        }

   
    }
    
    
    @objc func save(_ sender : UIButton) {
        
    }
    
    @objc func endEditing(){
         view.endEditing(true)
    }
    
    @objc func openSelectImage(_ sender : UIPanGestureRecognizer) {

        present(imagePicker, animated: true, completion: nil)
        
    }

}
extension OrganizationViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //Set Image
        if let image = info[.originalImage] as? UIImage {
            self.logoImageView.image = image
            imagePicker.dismiss(animated: true, completion: nil)
        }
        
        
    }
}
