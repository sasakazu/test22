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
    
//    var projectResult: Results<Project>!
 
    
    var reciveName:String = ""
    var reciveItem:String = ""
    var currentId:Int = 0
    var current:Int = 0
    var name:String = ""
    
//    let u:Array = [""]
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemLabel2: UILabel!
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        current = currentId
        
        print("cueewntIDは\(currentId)")
        
        print("cueewntは\(current)")
        
        
        
        
        let realm = try! Realm()
        
//        var users = realm.objects(Project.self).filter("name == %@", reciveName)
        
//        print(users.id)
        
        var users = realm.objects(Project.self).sorted(byKeyPath: "id", ascending: true)
        users = realm.objects(Project.self).filter("name == %@", reciveName)
        
        
//        users = realm.objects(Project.self).filter("id == %@", currentId)


        
        let u = users.first
        let days = u!.items
        
//        let id =
        print("現在表示しているのは\(String(describing: u))")
        
        label.text = u?.name
      
        for day in days {
            print("name: \(day.name)")
            
           print(day.name)
            
            itemLabel.text = day.name
            itemLabel2.text = day.name
            
          
        }
        
        
    }
    
    
    
    
    
    
    
}
