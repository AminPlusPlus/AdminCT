//
//  ViewController.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/19/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    //MARK:- UI Elements
    
    let appImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "c.circle.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = UIColor.systemPink
        return imageView
    }()
    
    let vLoginStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 7.0
        return stack
    }()
    let emailTextField  : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        return textField
    }()
    
    let passwordTextField  : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginBtn : UIButton =  {
        let btn = UIButton()
        btn.backgroundColor = UIColor.systemPink
        btn.isEnabled = false
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.alpha = 0.5
        btn.setTitle("Sign In", for: .normal)
        
        btn.addTarget(self, action: #selector(signIn(_:)), for: .touchUpInside)
        return btn
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.systemBackground
        
        initView()
    }
    
    
    fileprivate func initView () {
        
        emailTextField.delegate = self
        
        view.addSubview(appImageView)
        view.addSubview(vLoginStack)
        vLoginStack.addArrangedSubview(views: [emailTextField,passwordTextField,loginBtn])
        
        appImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).inset(120)
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(100)
            
        }
        
        vLoginStack.snp.makeConstraints { (snap) in
            snap.leading.trailing.equalTo(self.view).inset(20)
            snap.center.equalTo(self.view.center)
        }
        
        emailTextField.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        loginBtn.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
    }

    
    
    
    @objc fileprivate func signIn (_ btn : UIButton) {
        
        guard let _  = emailTextField.text else {return}
        guard let paswd  = passwordTextField.text, paswd.count > 5 else {
            return
        }
        
        let rootViewController = MainViewController() // SignInViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.modalPresentationStyle = .fullScreen
        //push view controller
        present(navigationController, animated: true, completion: nil)
    }

    
}

extension SignInViewController : UITextFieldDelegate {
   
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.hasPrefix("Admin") {
            self.loginBtn.isEnabled = true
            self.loginBtn.alpha = 1
            return
        }
           
        self.loginBtn.isEnabled = false
        self.loginBtn.alpha = 0.5
    
    }
}

