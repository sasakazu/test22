//
//  addItem.swift
//  test2
//
//  Created by 笹倉一也 on 2019/05/15.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class addItem: UIViewController {
    
    
    var reciveProject:String = ""
    
    
    @IBOutlet weak var itemTF: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = reciveProject

        print(reciveProject)
    
    }
    


    @IBAction func saveBtn(_ sender: Any) {
        
    
                let person = Project()
        
                person.name = reciveProject
        
//                let person = Project(value: ["name": "Yu"])
        
        
        
                do {
                    let realm = try Realm()
                    try! realm.write {
                        realm.add(person) //モデルオブジェクトの追加
                        print("1回目成功だよ", person)
                    }
                } catch {
                    print("エラーだよ")
                }
        
        
                let cat = Item()
        
                cat.name = itemTF.text!
        
        
        //        let cat = Item(value: ["name": "ijjtemtest"])
        
                /*
                 1対多を追加
                 */
                do {
                    let realm = try Realm()
                    try! realm.write {
                        person.items.append(cat) //1対多の関連を追加
        
                         print("追加後person.cats: \(person.items)") //catが含まれていることを確認
                    }
                } catch {
                }
        
//        do {
//            let realm = try Realm()
//            try! realm.write {
//                person.items.remove(at: 0) //1対多の関連を削除
//                print("削除後person.cats: \(person.items)") //catが含まれていないことを確認
//            }
//        } catch {
//
//        }
        

        self.navigationController?.popToRootViewController(animated: true)
    }

}
