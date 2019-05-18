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
    var currentID:Int = 0
    
    var name:String = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        var user = realm.objects(Project.self).filter("name == %@", reciveName)
        
        user = realm.objects(Project.self).sorted(byKeyPath: "id", ascending: true)
        
        print(user.count)
        print(user[currentID])
        
        user = realm.objects(Project.self).sorted(byKeyPath: "id", ascending: true)

        print(user.count)
        
        let u = user[currentID]
        let day = u.items
        print(day)
    
    }
    
    
    
    
    
    
    
}
