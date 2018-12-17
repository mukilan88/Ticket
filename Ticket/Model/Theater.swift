//
//  Theater.swift
//  Ticket
//
//  Created by AruniOS on 14/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import Foundation
import Realm
import RealmSwift


class Theater: Object {
    
 @objc dynamic var theaterID : String?
    @objc dynamic var theaterNameRealm : String?
    @objc dynamic var addressRealm : String?
    @objc dynamic var avaiableSeatRealm = 0
    @objc dynamic var dateRealm = 0
    @objc dynamic var timeRealm = 0
    @objc dynamic var amountRealm = 0
    
    
    override static func primaryKey()->String{
        return "theaterID"
    }
}

