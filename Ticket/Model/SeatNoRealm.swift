//
//  Module.swift
//  Ticket
//
//  Created by Mukil on 13/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class SeatNoRealm: Object {
    
    @objc dynamic var SeatNum : String?
  
    override static func primaryKey()->String{
        return "SeatNum"
    }
}
