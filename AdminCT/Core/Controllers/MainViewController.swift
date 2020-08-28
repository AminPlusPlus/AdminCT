//
//  MainViewController.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/19/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        initView()
    }
    
    
    
    fileprivate func initView () {
       
        //MARK:- TableView
        tableView.rowHeight = 100
        
    }
    
}
