//
//  detail.swift
//  test2
//
//  Created by 笹倉一也 on 2019/05/15.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class detail: UIViewController
//, UITableViewDataSource, UITableViewDelegate

{
    
    var projectResult: Results<Project>!
 
    
    var reciveName:String = ""
    var reciveItem:String = ""
    var currentId:Int = 0
    var current:Int = 0
    var name:String = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemLabel2: UILabel!
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        current = currentId - 1
        
        print("IDは\(currentId)")
        
        let realm = try! Realm()
        
//        var user = realm.objects(Project.self).filter("name == %@", reciveName)
        var users = realm.objects(Project.self).filter("id == %@", current)


        users = realm.objects(Project.self).sorted(byKeyPath: "id", ascending: true)
        
        
        
        let u = users[current]
        let days = u.items
        print("現在表示しているのは\(u)")
        
        label.text = reciveName
      
        for day in days {
            print("name: \(day.name)")
            
          
        }
        
        
    }
    
    
    
    
    
    
    
}
