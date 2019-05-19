//
//  table.swift
//  test2
//
//  Created by 笹倉一也 on 2019/05/15.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift


class table: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    var projectName: Results<Project>!
    var currr:Int = 0
    var Name:String = ""
    var itemName:String = ""

    
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
         let realm = try! Realm()
        
        projectName = realm.objects(Project.self)
            
    
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return projectName.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {
        
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        let object = projectName[indexpath.row]
        
        cell.textLabel?.text = object.name
        
        return cell
        
    
}
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let object = projectName[indexPath.row]
        
        currr = object.id
        
        Name = object.name
  
        performSegue(withIdentifier: "go",sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "go") {
            
            
            let secondVC: detail = (segue.destination as? detail)!
            
            
            secondVC.reciveName = Name
            secondVC.currentId = currr
            
        }
        
    }
    
    
    
    
}
