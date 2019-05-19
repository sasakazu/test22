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
    @IBOutlet weak var item2: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = reciveProject

        print(reciveProject)
    
    }
    


    @IBAction func saveBtn(_ sender: Any) {
        
                let person = Project()
        
                person.name = reciveProject
        
                person.save()
        
        
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
        
                /*
                 1対多を追加
                 */
                do {
                    let realm = try Realm()
                    try! realm.write {
                        person.items.append(cat) //1対多の関連を追加
        
                    }
                } catch {
                }
        
        
        let dog = Item()
        
        dog.name = item2.text!
        
        
        do {
            let realm = try Realm()
            try! realm.write {
                person.items.append(dog) //1対多の関連を追加
                
                print("追加後person.cats: \(person.items)") //catが含まれていることを確認
            }
        } catch {
        }
        
        

        self.navigationController?.popToRootViewController(animated: true)
    }

}
