//
//  object.swift
//  Pods-test2
//
//  Created by 笹倉一也 on 2019/05/15.
//

import Foundation
import RealmSwift


class Project: Object {

    @objc dynamic var id : Int = 0

    @objc dynamic var name : String = ""

    let items = List<Item>()    // 1対Nの関係

    override static func primaryKey() -> String? {
        return "id"

    }

    override static func indexedProperties() -> [String] {

        return ["name"]
        
    }

    
}

class Item: Object {
    
    @objc dynamic var name : String = ""
    
}
