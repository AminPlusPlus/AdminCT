//
//  MainViewController.swift
//  AdminCT
//
//  Created by Aminjoni Abdullozoda on 8/19/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit



class MainViewController: UITableViewController {
    
    var organizations : ListOrganization = [:]  //[Organization] = HelpData.fakeOrganizationDate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        initView()
        startActivityIndicator()
        DataService.getAllOrganizations { (listOrgs, error) in
           
            if error == nil {
                
                guard let orgs = listOrgs else { return  }
                self.organizations = orgs
                
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                     self.stopActivityIndicator()
                    
                }
            }
            
            //Error Message
            print(error?.localizedDescription)
            
        }
        
        
    }
    
    
    
    
    
    fileprivate func initView () {
        
        navigationItem.title = "Organizations"
        
        //Add navigation item
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewOrganization))
       
        
        
        
        //MARK:- TableView
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    @objc func addNewOrganization() {
        let organizationViewController = OrganizationViewController()
        navigationController?.pushViewController(organizationViewController, animated: true)
    }
    
}


extension MainViewController {
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = organizations[indexPath.row].value.name ?? ""
        cell.selectionStyle = .none
      
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let organizationViewController = OrganizationViewController()
       
        organizationViewController.organization = organizations[indexPath.row].value
        navigationController?.pushViewController(organizationViewController, animated: true)
  
    }
    
    
    
}
