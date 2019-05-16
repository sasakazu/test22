//
//  addProject.swift
//  test2
//
//  Created by 笹倉一也 on 2019/05/15.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class addProject: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var text: UITextField!
    
    @IBOutlet weak var itemTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.delegate = self
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    

    @IBAction func bbb(_ sender: Any) {
        
        
//        let person = Project()
//
//        person.name = text.text!
//
////        let person = Project(value: ["name": "Yu"])
//
//        do {
//            let realm = try Realm()
//            try! realm.write {
//                realm.add(person) //モデルオブジェクトの追加
//                print("1回目成功だよ", person)
//            }
//        } catch {
//            print("エラーだよ")
//        }
        
     
//        let cat = Item()
//
//        cat.name = itemTF.text!
//
//
////        let cat = Item(value: ["name": "ijjtemtest"])
//
//        /*
//         1対多を追加
//         */
//        do {
//            let realm = try Realm()
//            try! realm.write {
//                person.items.append(cat) //1対多の関連を追加
//
//                 print("追加後person.cats: \(person.items)") //catが含まれていることを確認
//            }
//        } catch {
//        }


        
//        performSegue(withIdentifier: "go", sender: nil)
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as? addItem
        let _ = next?.view

        next?.reciveProject = text.text!
    }
    
    
    
    
    }

    

    
    

