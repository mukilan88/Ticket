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

class Seat: Object {
    @objc dynamic var seatNumRealm : String?
    @objc dynamic var seatNumID : String?
    @objc dynamic var isBookedRealm = 0
  
    override static func primaryKey()->String{
        return "seatNumID"
        
    }
}
