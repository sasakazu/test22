//
//  detail.swift
//  test2
//
//  Created by 笹倉一也 on 2019/05/15.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class detail: UIViewController, UITableViewDataSource, UITableViewDelegate

{

    
    
//    var users: Results<Project>!
    var itemResult: Results<Item>!
 
    
    var reciveName:String = ""
    var reciveItem:String = ""
    var currentId:Int = 0
    var current:Int = 0
    var name:String = ""
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableview: UITableView!
    //    @IBOutlet weak var itemLabel: UILabel!
//    @IBOutlet weak var itemLabel2: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let realm = try! Realm()
        
        var users = realm.objects(Project.self).sorted(byKeyPath: "id", ascending: true)
        
        users = realm.objects(Project.self).filter("name == %@", reciveName)
        
//        配列の最初だけをとる
        let u = users[0]
        let days = u.items
        

        print("現在表示しているのは\(u))")
        
        label.text = u.name
      
        for day in days {
            print("name: \(day.name)")
            
           print(day.name)
            
           print(u.items.count)
            
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
            tableview.reloadData()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let realm = try! Realm()
        
        var users = realm.objects(Project.self).sorted(byKeyPath: "id", ascending: true)
        
        users = realm.objects(Project.self).filter("name == %@", reciveName)
        
      
        let u = users[0]
        
        let it = u.items
        
        return it.count
    
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
//        let object = itemResult[indexPath.row]
        
        
        let realm = try! Realm()
        
        var users = realm.objects(Project.self).sorted(byKeyPath: "id", ascending: true)
        
        users = realm.objects(Project.self).filter("name == %@", reciveName)
        
        //        配列の最初だけをとる
        let u = users[0]
        let days = u.items[indexPath.row]
        
        
        
        
       
//        for day in days {
        
            cell.textLabel?.text = days.name
            
//            print("name: \(day.name)")
//
//            print(day.name)
//
//            print(u.items.count)
            
            
        
        
        
        
        return cell
        
    

    }
    
    
    
    
    
    
}
