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
        itemTF.delegate = self
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    

    @IBAction func bbb(_ sender: Any) {


        let newSetMenu = Project()

        newSetMenu.name = text.text!

        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                
                realm.add(newSetMenu)
                print("プロジェクト名成功！！")

            })
        }catch{
            print("失敗！！！")
        }
        
        let newItem = Item()
        
        newItem.name = itemTF.text!
        
        do {
            let realm = try Realm()
            try! realm.write {
                newSetMenu.items.append(newItem) //1対多の関連を追加
                print("追加後person") //catが含まれていることを確認
            }
        } catch {
        }

        
        
        
    }
    
    
    
    
    }

    

    
    

