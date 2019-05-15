//
//  ViewController.swift
//  test2
//
//  Created by 笹倉一也 on 2019/05/15.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var text: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        text.delegate = self
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }

    @IBAction func button(_ sender: Any) {
        
        let newSetMenu = Project()

        newSetMenu.name = text.text!
        
        
        
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newSetMenu)
                print("成功！！")
                
            })
        }catch{
            print("失敗！！！")
        }
        
    

    }
    
    
    
    
}

